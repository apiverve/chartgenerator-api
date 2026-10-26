# Chart Generator API - Dart/Flutter Client

Chart Generator is a chart API that turns your data into chart and graph images. Supports bar, line, pie, doughnut, radar, and polar area charts with customizable styling.

[![pub package](https://img.shields.io/pub/v/apiverve_chartgenerator.svg)](https://pub.dev/packages/apiverve_chartgenerator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Chart Generator API](https://apiverve.com/marketplace/chartgenerator?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_chartgenerator: ^1.2.3
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_chartgenerator/apiverve_chartgenerator.dart';

void main() async {
  final client = ChartgeneratorClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'type': 'bar',
      'labels': Q1,Q2,Q3,Q4,
      'datasets': [object Object],[object Object],
      'title': 'Quarterly Report'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "id": "6a783c9c-f959-4a88-80cb-84580b8c788d",
    "format": ".png",
    "expires": 1766010059346,
    "type": "bar",
    "downloadURL": "https://storage.googleapis.com/apiverve/APIData/chartgenerator/6a783c9c-f959-4a88-80cb-84580b8c788d.png?GoogleAccessId=635500398038-compute%40developer.gserviceaccount.com&Expires=1766010059&Signature=Iud%2B7hoPRtPbWoJXQAAnhN9nqUHObHQ7PaiJCtkWQzEzpMexPMRR3BIPKkwOUMAwT6YcNbvywgnLvU2SV7498rbp%2FZbktuAR3Ok1E3O6p4ZJJ4s%2FpW8HAZgIBJpDlPUQt%2FjulQLtwP2I2GUPVmgWheXitnWsWq1S3E2k4viysXwS8H2%2B8BBdxjS%2Bv1ruGXbqd4RpdzdLst4e9YtHGWNZuiaL8zX8%2FHA1zreyrewY2fpB4g0pHnh%2B3IDE48eIohb4HQoDc9vXy4s8sIoqLScmTLyxyq1pPYlak1n1PWdbLcz4TBr41JnLELzF%2BBwCkyrLts9dhisSseaIB7d4g4JQnw%3D%3D"
  }
}
```

## API Reference

- **API Home:** [Chart Generator API](https://apiverve.com/marketplace/chartgenerator?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/chartgenerator](https://docs.apiverve.com/ref/chartgenerator?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
