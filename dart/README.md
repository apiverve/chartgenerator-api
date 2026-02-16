# Chart Generator API - Dart/Flutter Client

Chart Generator creates beautiful chart images from your data. Supports bar, line, pie, doughnut, radar, and polar area charts with customizable styling.

[![pub package](https://img.shields.io/pub/v/apiverve_chartgenerator.svg)](https://pub.dev/packages/apiverve_chartgenerator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Chart Generator API](https://chartgenerator.apiverve.com?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_chartgenerator: ^1.1.14
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
      'data': [object Object]
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
    "id": "15e899a6-5eec-40ca-a617-4480f5a801c8",
    "format": ".png",
    "expires": 1740173365411,
    "type": "bar",
    "downloadURL": "https://storage.googleapis.com/apiverve.appspot.com/chartgenerator/15e899a6-5eec-40ca-a617-4480f5a801c8.png?GoogleAccessId=635500398038-compute%40developer.gserviceaccount.com&Expires=1740173365&Signature=BlQo5Pp0YfG9MmKGKHtvbULtYPA5jenQ14ZYrKzqZRKGVz9yiiEsVaRq0XsVFj2fM5pSZ8NRcT%2FZj%2FtIHTFid6jxjp6PPdZmO%2Fu9uNKjS5b204U0xQxtg%2F9t6TIzk%2BzthmV0JZl8xeZph6B4htBUrZWv7gVW0RDbnHnQPfXcoqKW8CMRmN%2F9crjQNtCqpvdPMS4VMYbCoqDFpLj2SaRqitYhzK9oyA6GNQ9ZyQoM0wGJrXnyYLGq5uq00xWs9hql%2FSzehgAKJj%2BrtE%2F0%2FGfBB3zFbgzolggYQKxrj6I%2FusvO%2F3Ng5UO84Bbz%2BIqQcZr7BAUW1mF49096fYhplEOayg%3D%3D"
  }
}
```

## API Reference

- **API Home:** [Chart Generator API](https://chartgenerator.apiverve.com?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/chartgenerator](https://docs.apiverve.com/ref/chartgenerator?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
