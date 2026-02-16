ChartGenerator API
============

Chart Generator creates beautiful chart images from your data. Supports bar, line, pie, doughnut, radar, and polar area charts with customizable styling.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a .NET Wrapper for the [ChartGenerator API](https://chartgenerator.apiverve.com?utm_source=nuget&utm_medium=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.ChartGenerator
```

Using the Package Manager:
```
nuget install APIVerve.API.ChartGenerator
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.ChartGenerator
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.ChartGenerator"
5. Click on the APIVerve.API.ChartGenerator package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the chartgenerator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new QueryOptions {
    type = "bar",
    data = {
        labels = [
            "Q1",
            "Q2",
            "Q3",
            "Q4"
        ],
        datasets = [
            {
                label = "Users",
                data = [
                    50,
                    60,
                    70,
                    180
                ]
            },
            {
                label = "Revenue",
                data = [
                    100,
                    200,
                    300,
                    400
                ]
            }
        ]
    }
};

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The ChartGenerator API documentation is found here: [https://docs.apiverve.com/ref/chartgenerator](https://docs.apiverve.com/ref/chartgenerator?utm_source=nuget&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
ChartGenerator API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new QueryOptions {
    type = "bar",
    data = {
        labels = [
            "Q1",
            "Q2",
            "Q3",
            "Q4"
        ],
        datasets = [
            {
                label = "Users",
                data = [
                    50,
                    60,
                    70,
                    180
                ]
            },
            {
                label = "Revenue",
                data = [
                    100,
                    200,
                    300,
                    400
                ]
            }
        ]
    }
};

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new QueryOptions {
    type = "bar",
    data = {
        labels = [
            "Q1",
            "Q2",
            "Q3",
            "Q4"
        ],
        datasets = [
            {
                label = "Users",
                data = [
                    50,
                    60,
                    70,
                    180
                ]
            },
            {
                label = "Revenue",
                data = [
                    100,
                    200,
                    300,
                    400
                ]
            }
        ]
    }
};

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new QueryOptions {
    type = "bar",
    data = {
        labels = [
            "Q1",
            "Q2",
            "Q3",
            "Q4"
        ],
        datasets = [
            {
                label = "Users",
                data = [
                    50,
                    60,
                    70,
                    180
                ]
            },
            {
                label = "Revenue",
                data = [
                    100,
                    200,
                    300,
                    400
                ]
            }
        ]
    }
};

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new QueryOptions {
    type = "bar",
    data = {
        labels = [
            "Q1",
            "Q2",
            "Q3",
            "Q4"
        ],
        datasets = [
            {
                label = "Users",
                data = [
                    50,
                    60,
                    70,
                    180
                ]
            },
            {
                label = "Revenue",
                data = [
                    100,
                    200,
                    300,
                    400
                ]
            }
        ]
    }
};

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new QueryOptions {
    type = "bar",
    data = {
        labels = [
            "Q1",
            "Q2",
            "Q3",
            "Q4"
        ],
        datasets = [
            {
                label = "Users",
                data = [
                    50,
                    60,
                    70,
                    180
                ]
            },
            {
                label = "Revenue",
                data = [
                    100,
                    200,
                    300,
                    400
                ]
            }
        ]
    }
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new QueryOptions {
    type = "bar",
    data = {
        labels = [
            "Q1",
            "Q2",
            "Q3",
            "Q4"
        ],
        datasets = [
            {
                label = "Users",
                data = [
                    50,
                    60,
                    70,
                    180
                ]
            },
            {
                label = "Revenue",
                data = [
                    100,
                    200,
                    300,
                    400
                ]
            }
        ]
    }
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new QueryOptions {
    type = "bar",
    data = {
        labels = [
            "Q1",
            "Q2",
            "Q3",
            "Q4"
        ],
        datasets = [
            {
                label = "Users",
                data = [
                    50,
                    60,
                    70,
                    180
                ]
            },
            {
                label = "Revenue",
                data = [
                    100,
                    200,
                    300,
                    400
                ]
            }
        ]
    }
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new QueryOptions {
    type = "bar",
    data = {
        labels = [
            "Q1",
            "Q2",
            "Q3",
            "Q4"
        ],
        datasets = [
            {
                label = "Users",
                data = [
                    50,
                    60,
                    70,
                    180
                ]
            },
            {
                label = "Revenue",
                data = [
                    100,
                    200,
                    300,
                    400
                ]
            }
        ]
    }
};

using (var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
```

---

## Example Response

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

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=readme) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
