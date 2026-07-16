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
using APIVerve.API.ChartGenerator;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new ChartGeneratorQueryOptions {
    type = "bar",
    labels = [
        "Q1",
        "Q2",
        "Q3",
        "Q4"
    ],
    datasets = [
        {
            name = "Sales",
            values = [
                50,
                60,
                70,
                180
            ]
        },
        {
            name = "Revenue",
            values = [
                100,
                200,
                300,
                400
            ]
        }
    ],
    title = "Quarterly Report"
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
using APIVerve.API.ChartGenerator;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new ChartGeneratorQueryOptions {
    type = "bar",
    labels = [
        "Q1",
        "Q2",
        "Q3",
        "Q4"
    ],
    datasets = [
        {
            name = "Sales",
            values = [
                50,
                60,
                70,
                180
            ]
        },
        {
            name = "Revenue",
            values = [
                100,
                200,
                300,
                400
            ]
        }
    ],
    title = "Quarterly Report"
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
using APIVerve.API.ChartGenerator;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new ChartGeneratorQueryOptions {
    type = "bar",
    labels = [
        "Q1",
        "Q2",
        "Q3",
        "Q4"
    ],
    datasets = [
        {
            name = "Sales",
            values = [
                50,
                60,
                70,
                180
            ]
        },
        {
            name = "Revenue",
            values = [
                100,
                200,
                300,
                400
            ]
        }
    ],
    title = "Quarterly Report"
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
using APIVerve.API.ChartGenerator;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new ChartGeneratorQueryOptions {
    type = "bar",
    labels = [
        "Q1",
        "Q2",
        "Q3",
        "Q4"
    ],
    datasets = [
        {
            name = "Sales",
            values = [
                50,
                60,
                70,
                180
            ]
        },
        {
            name = "Revenue",
            values = [
                100,
                200,
                300,
                400
            ]
        }
    ],
    title = "Quarterly Report"
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
using APIVerve.API.ChartGenerator;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new ChartGeneratorAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new ChartGeneratorQueryOptions {
    type = "bar",
    labels = [
        "Q1",
        "Q2",
        "Q3",
        "Q4"
    ],
    datasets = [
        {
            name = "Sales",
            values = [
                50,
                60,
                70,
                180
            ]
        },
        {
            name = "Revenue",
            values = [
                100,
                200,
                300,
                400
            ]
        }
    ],
    title = "Quarterly Report"
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

var queryOptions = new ChartGeneratorQueryOptions {
    type = "bar",
    labels = [
        "Q1",
        "Q2",
        "Q3",
        "Q4"
    ],
    datasets = [
        {
            name = "Sales",
            values = [
                50,
                60,
                70,
                180
            ]
        },
        {
            name = "Revenue",
            values = [
                100,
                200,
                300,
                400
            ]
        }
    ],
    title = "Quarterly Report"
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

var queryOptions = new ChartGeneratorQueryOptions {
    type = "bar",
    labels = [
        "Q1",
        "Q2",
        "Q3",
        "Q4"
    ],
    datasets = [
        {
            name = "Sales",
            values = [
                50,
                60,
                70,
                180
            ]
        },
        {
            name = "Revenue",
            values = [
                100,
                200,
                300,
                400
            ]
        }
    ],
    title = "Quarterly Report"
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

var queryOptions = new ChartGeneratorQueryOptions {
    type = "bar",
    labels = [
        "Q1",
        "Q2",
        "Q3",
        "Q4"
    ],
    datasets = [
        {
            name = "Sales",
            values = [
                50,
                60,
                70,
                180
            ]
        },
        {
            name = "Revenue",
            values = [
                100,
                200,
                300,
                400
            ]
        }
    ],
    title = "Quarterly Report"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new ChartGeneratorQueryOptions {
    type = "bar",
    labels = [
        "Q1",
        "Q2",
        "Q3",
        "Q4"
    ],
    datasets = [
        {
            name = "Sales",
            values = [
                50,
                60,
                70,
                180
            ]
        },
        {
            name = "Revenue",
            values = [
                100,
                200,
                300,
                400
            ]
        }
    ],
    title = "Quarterly Report"
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
    "id": "6a783c9c-f959-4a88-80cb-84580b8c788d",
    "format": ".png",
    "expires": 1766010059346,
    "type": "bar",
    "downloadURL": "https://storage.googleapis.com/apiverve/APIData/chartgenerator/6a783c9c-f959-4a88-80cb-84580b8c788d.png?GoogleAccessId=635500398038-compute%40developer.gserviceaccount.com&Expires=1766010059&Signature=Iud%2B7hoPRtPbWoJXQAAnhN9nqUHObHQ7PaiJCtkWQzEzpMexPMRR3BIPKkwOUMAwT6YcNbvywgnLvU2SV7498rbp%2FZbktuAR3Ok1E3O6p4ZJJ4s%2FpW8HAZgIBJpDlPUQt%2FjulQLtwP2I2GUPVmgWheXitnWsWq1S3E2k4viysXwS8H2%2B8BBdxjS%2Bv1ruGXbqd4RpdzdLst4e9YtHGWNZuiaL8zX8%2FHA1zreyrewY2fpB4g0pHnh%2B3IDE48eIohb4HQoDc9vXy4s8sIoqLScmTLyxyq1pPYlak1n1PWdbLcz4TBr41JnLELzF%2BBwCkyrLts9dhisSseaIB7d4g4JQnw%3D%3D"
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
