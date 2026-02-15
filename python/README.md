Chart Generator API
============

Chart Generator creates beautiful chart images from your data. Supports bar, line, pie, doughnut, radar, and polar area charts with customizable styling.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Python API Wrapper for the [Chart Generator API](https://chartgenerator.apiverve.com?utm_source=pypi&utm_medium=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-chartgenerator
```

Using `pip3`:

```bash
pip3 install apiverve-chartgenerator
```

---

## Configuration

Before using the chartgenerator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_chartgenerator.apiClient import ChartgeneratorAPIClient

# Initialize the client with your APIVerve API key
api = ChartgeneratorAPIClient("[YOUR_API_KEY]")

query = { "type": "bar", "data": { "labels": [ "Q1", "Q2", "Q3", "Q4" ], "datasets": [ { "label": "Users", "data": [ 50, 60, 70, 180 ] }, { "label": "Revenue", "data": [ 100, 200, 300, 400 ] } ] } }

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Chart Generator API documentation is found here: [https://docs.apiverve.com/ref/chartgenerator](https://docs.apiverve.com/ref/chartgenerator?utm_source=pypi&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_chartgenerator.apiClient import ChartgeneratorAPIClient

# Initialize the client with your APIVerve API key
api = ChartgeneratorAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = { "type": "bar", "data": { "labels": [ "Q1", "Q2", "Q3", "Q4" ], "datasets": [ { "label": "Users", "data": [ 50, 60, 70, 180 ] }, { "label": "Revenue", "data": [ 100, 200, 300, 400 ] } ] } }
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `ChartgeneratorAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_chartgenerator.apiClient import ChartgeneratorAPIClient, ChartgeneratorAPIClientError

api = ChartgeneratorAPIClient("[YOUR_API_KEY]")

query = { "type": "bar", "data": { "labels": [ "Q1", "Q2", "Q3", "Q4" ], "datasets": [ { "label": "Users", "data": [ 50, 60, 70, 180 ] }, { "label": "Revenue", "data": [ 100, 200, 300, 400 ] } ] } }

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except ChartgeneratorAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_chartgenerator.apiClient import ChartgeneratorAPIClient, ChartgeneratorAPIClientError

api = ChartgeneratorAPIClient("[YOUR_API_KEY]")

query = { "type": "bar", "data": { "labels": [ "Q1", "Q2", "Q3", "Q4" ], "datasets": [ { "label": "Users", "data": [ 50, 60, 70, 180 ] }, { "label": "Revenue", "data": [ 100, 200, 300, 400 ] } ] } }

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except ChartgeneratorAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_chartgenerator.apiClient import ChartgeneratorAPIClient, ChartgeneratorAPIClientError

query = { "type": "bar", "data": { "labels": [ "Q1", "Q2", "Q3", "Q4" ], "datasets": [ { "label": "Users", "data": [ 50, 60, 70, 180 ] }, { "label": "Revenue", "data": [ 100, 200, 300, 400 ] } ] } }

# Using context manager ensures proper cleanup
with ChartgeneratorAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except ChartgeneratorAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_chartgenerator.apiClient import ChartgeneratorAPIClient

# Enable debug mode
api = ChartgeneratorAPIClient("[YOUR_API_KEY]", debug=True)

query = { "type": "bar", "data": { "labels": [ "Q1", "Q2", "Q3", "Q4" ], "datasets": [ { "label": "Users", "data": [ 50, 60, 70, 180 ] }, { "label": "Revenue", "data": [ 100, 200, 300, 400 ] } ] } }

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_chartgenerator.apiClient import ChartgeneratorAPIClient

api = ChartgeneratorAPIClient("[YOUR_API_KEY]")

try:
    query = { "type": "bar", "data": { "labels": [ "Q1", "Q2", "Q3", "Q4" ], "datasets": [ { "label": "Users", "data": [ 50, 60, 70, 180 ] }, { "label": "Revenue", "data": [ 100, 200, 300, 400 ] } ] } }
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=readme) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
