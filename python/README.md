Chart Generator API
============

Chart Generator is a chart API that turns your data into chart and graph images. Supports bar, line, pie, doughnut, radar, and polar area charts with customizable styling.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-chartgenerator.svg)](https://pypi.org/project/apiverve-chartgenerator/)

This is a Python wrapper for the [Chart Generator API](https://apiverve.com/marketplace/chartgenerator?utm_source=pypi&utm_medium=referral&utm_content=readme)

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

Before using the Chart Generator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_chartgenerator.apiClient import ChartgeneratorAPIClient

# Initialize the client with your APIVerve API key
api = ChartgeneratorAPIClient("[YOUR_API_KEY]")

query = {
    "type": "bar",
    "labels": ["Q1","Q2","Q3","Q4"],
    "datasets": [{"name":"Sales","values":[50,60,70,180]},{"name":"Revenue","values":[100,200,300,400]}],
    "title": "Quarterly Report"
}

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

The Chart Generator API documentation is found here: [https://docs.apiverve.com/ref/chartgenerator](https://docs.apiverve.com/ref/chartgenerator?utm_source=pypi&utm_medium=referral&utm_content=readme).
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
query = {
    "type": "bar",
    "labels": ["Q1","Q2","Q3","Q4"],
    "datasets": [{"name":"Sales","values":[50,60,70,180]},{"name":"Revenue","values":[100,200,300,400]}],
    "title": "Quarterly Report"
}
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
    "id": "6a783c9c-f959-4a88-80cb-84580b8c788d",
    "format": ".png",
    "expires": 1766010059346,
    "type": "bar",
    "downloadURL": "https://storage.googleapis.com/apiverve/APIData/chartgenerator/6a783c9c-f959-4a88-80cb-84580b8c788d.png?GoogleAccessId=635500398038-compute%40developer.gserviceaccount.com&Expires=1766010059&Signature=Iud%2B7hoPRtPbWoJXQAAnhN9nqUHObHQ7PaiJCtkWQzEzpMexPMRR3BIPKkwOUMAwT6YcNbvywgnLvU2SV7498rbp%2FZbktuAR3Ok1E3O6p4ZJJ4s%2FpW8HAZgIBJpDlPUQt%2FjulQLtwP2I2GUPVmgWheXitnWsWq1S3E2k4viysXwS8H2%2B8BBdxjS%2Bv1ruGXbqd4RpdzdLst4e9YtHGWNZuiaL8zX8%2FHA1zreyrewY2fpB4g0pHnh%2B3IDE48eIohb4HQoDc9vXy4s8sIoqLScmTLyxyq1pPYlak1n1PWdbLcz4TBr41JnLELzF%2BBwCkyrLts9dhisSseaIB7d4g4JQnw%3D%3D"
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

query = {
    "type": "bar",
    "labels": ["Q1","Q2","Q3","Q4"],
    "datasets": [{"name":"Sales","values":[50,60,70,180]},{"name":"Revenue","values":[100,200,300,400]}],
    "title": "Quarterly Report"
}

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

query = {
    "type": "bar",
    "labels": ["Q1","Q2","Q3","Q4"],
    "datasets": [{"name":"Sales","values":[50,60,70,180]},{"name":"Revenue","values":[100,200,300,400]}],
    "title": "Quarterly Report"
}

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

query = {
    "type": "bar",
    "labels": ["Q1","Q2","Q3","Q4"],
    "datasets": [{"name":"Sales","values":[50,60,70,180]},{"name":"Revenue","values":[100,200,300,400]}],
    "title": "Quarterly Report"
}

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

query = {
    "type": "bar",
    "labels": ["Q1","Q2","Q3","Q4"],
    "datasets": [{"name":"Sales","values":[50,60,70,180]},{"name":"Revenue","values":[100,200,300,400]}],
    "title": "Quarterly Report"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_chartgenerator.apiClient import ChartgeneratorAPIClient

api = ChartgeneratorAPIClient("[YOUR_API_KEY]")

query = {
    "type": "bar",
    "labels": ["Q1","Q2","Q3","Q4"],
    "datasets": [{"name":"Sales","values":[50,60,70,180]},{"name":"Revenue","values":[100,200,300,400]}],
    "title": "Quarterly Report"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
