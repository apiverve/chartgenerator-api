import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class ChartgeneratorValidationException implements Exception {
  final List<String> errors;

  ChartgeneratorValidationException(this.errors);

  @override
  String toString() => 'ChartgeneratorValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Chart Generator API client.
///
/// For more information, visit: https://chartgenerator.apiverve.com?utm_source=dart&utm_medium=readme
///
/// Parameters:
/// * [type] - Chart type
/// * [labels] (required) - Array of labels for the x-axis or chart segments
/// * [datasets] (required) - Array of datasets with 'name' and 'values'
/// * [title] - Optional title displayed on the chart
/// * [width] - Image width in pixels [min: 100, max: 1024]
/// * [height] - Image height in pixels [min: 100, max: 1024]
/// * [format] - Output format
class ChartgeneratorClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'type': ValidationRule(type: 'string', required: false),
    'labels': ValidationRule(type: 'array', required: true),
    'datasets': ValidationRule(type: 'array', required: true),
    'title': ValidationRule(type: 'string', required: false),
    'width': ValidationRule(type: 'integer', required: false, min: 100, max: 1024),
    'height': ValidationRule(type: 'integer', required: false, min: 100, max: 1024),
    'format': ValidationRule(type: 'string', required: false),
  };

  ChartgeneratorClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/chartgenerator',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [ChartgeneratorValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw ChartgeneratorValidationException(errors);
    }
  }

  /// Execute a request to the Chart Generator API.
  ///
  /// Parameters are validated before sending the request.
  Future<ChartgeneratorResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw ChartgeneratorException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final response = await _httpClient.post(
        Uri.parse(baseUrl),
        headers: {
          'x-api-key': apiKey,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(params),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return ChartgeneratorResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw ChartgeneratorException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw ChartgeneratorException('Resource not found');
      } else {
        throw ChartgeneratorException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is ChartgeneratorException) rethrow;
      throw ChartgeneratorException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Chart Generator API client.
class ChartgeneratorException implements Exception {
  final String message;

  ChartgeneratorException(this.message);

  @override
  String toString() => 'ChartgeneratorException: $message';
}
