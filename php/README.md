# Chart Generator API - PHP Package

Chart Generator creates beautiful chart images from your data. Supports bar, line, pie, doughnut, radar, and polar area charts with customizable styling.

## Installation

Install via Composer:

```bash
composer require apiverve/chartgenerator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Chartgenerator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'type' => 'bar',
    'labels' => Q1,Q2,Q3,Q4,
    'datasets' => [object Object],[object Object],
    'title' => 'Quarterly Report'
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Chartgenerator\Client;
use APIVerve\Chartgenerator\Exceptions\APIException;
use APIVerve\Chartgenerator\Exceptions\ValidationException;

try {
    $response = $client->execute(['type' => 'bar', 'labels' => Q1,Q2,Q3,Q4, 'datasets' => [object Object],[object Object], 'title' => 'Quarterly Report']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/chartgenerator?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://chartgenerator.apiverve.com?utm_source=php&utm_medium=readme](https://chartgenerator.apiverve.com?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
