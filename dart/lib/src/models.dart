/// Response models for the Chart Generator API.

/// API Response wrapper.
class ChartgeneratorResponse {
  final String status;
  final dynamic error;
  final ChartgeneratorData? data;

  ChartgeneratorResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory ChartgeneratorResponse.fromJson(Map<String, dynamic> json) => ChartgeneratorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? ChartgeneratorData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Chart Generator API.

class ChartgeneratorData {
  String? id;
  String? format;
  int? expires;
  String? type;
  String? downloadURL;

  ChartgeneratorData({
    this.id,
    this.format,
    this.expires,
    this.type,
    this.downloadURL,
  });

  factory ChartgeneratorData.fromJson(Map<String, dynamic> json) => ChartgeneratorData(
      id: json['id'],
      format: json['format'],
      expires: json['expires'],
      type: json['type'],
      downloadURL: json['downloadURL'],
    );
}

class ChartgeneratorRequest {
  String? type;
  Map<String, dynamic>? data;

  ChartgeneratorRequest({
    this.type,
    this.data,
  });

  Map<String, dynamic> toJson() => {
      if (type != null) 'type': type,
      if (data != null) 'data': data,
    };
}
