/// Response models for the Chart Generator API.

/// API Response wrapper.
class ChartgeneratorResponse {
  final String status;
  final dynamic error;
  final ChartgeneratorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  ChartgeneratorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory ChartgeneratorResponse.fromJson(Map<String, dynamic> json) => ChartgeneratorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? ChartgeneratorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Chart Generator API.

class ChartgeneratorData {
  String? id;
  String? format;
  num? expires;
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
  List<String> labels;
  List<Map<String, dynamic>> datasets;
  String? title;

  ChartgeneratorRequest({
    this.type,
    required this.labels,
    required this.datasets,
    this.title,
  });

  Map<String, dynamic> toJson() => {
      if (type != null) 'type': type,
      'labels': labels,
      'datasets': datasets,
      if (title != null) 'title': title,
    };
}
