# Chart Generator API

Chart Generator creates beautiful chart images from your data. Supports bar, line, pie, doughnut, radar, and polar area charts with customizable styling.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)
[![npm version](https://img.shields.io/npm/v/@apiverve/chartgenerator.svg)](https://www.npmjs.com/package/@apiverve/chartgenerator)

This is a Javascript Wrapper for the [Chart Generator API](https://chartgenerator.apiverve.com?utm_source=npm&utm_medium=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/chartgenerator
```

Using yarn:
```shell
yarn add @apiverve/chartgenerator
```

---

## Configuration

Before using the Chart Generator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=readme)

The Chart Generator API documentation is found here: [https://docs.apiverve.com/ref/chartgenerator](https://docs.apiverve.com/ref/chartgenerator?utm_source=npm&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const chartgeneratorAPI = require('@apiverve/chartgenerator');
const api = new chartgeneratorAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  "type": "bar",
  "labels": [
    "Q1",
    "Q2",
    "Q3",
    "Q4"
  ],
  "datasets": [
    {
      "name": "Sales",
      "values": [
        50,
        60,
        70,
        180
      ]
    },
    {
      "name": "Revenue",
      "values": [
        100,
        200,
        300,
        400
      ]
    }
  ],
  "title": "Quarterly Report"
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  "type": "bar",
  "labels": [
    "Q1",
    "Q2",
    "Q3",
    "Q4"
  ],
  "datasets": [
    {
      "name": "Sales",
      "values": [
        50,
        60,
        70,
        180
      ]
    },
    {
      "name": "Revenue",
      "values": [
        100,
        200,
        300,
        400
      ]
    }
  ],
  "title": "Quarterly Report"
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  "type": "bar",
  "labels": [
    "Q1",
    "Q2",
    "Q3",
    "Q4"
  ],
  "datasets": [
    {
      "name": "Sales",
      "values": [
        50,
        60,
        70,
        180
      ]
    },
    {
      "name": "Revenue",
      "values": [
        100,
        200,
        300,
        400
      ]
    }
  ],
  "title": "Quarterly Report"
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
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

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=readme), [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=readme), and [Refund Policy](https://apiverve.com/refund?utm_source=npm&utm_medium=readme).

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
