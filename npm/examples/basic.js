/**
 * Basic Example - Chart Generator API
 *
 * This example demonstrates how to use the Chart Generator API.
 * Make sure to set your API key in the .env file or replace '[YOUR_API_KEY]' below.
 */

require('dotenv').config();
const chartgeneratorAPI = require('../index.js');

// Initialize the API client
const api = new chartgeneratorAPI({
    api_key: process.env.API_KEY || '[YOUR_API_KEY]'
});

// Example query
var query = {
  "type": "bar",
  "data": {
    "labels": [
      "Q1",
      "Q2",
      "Q3",
      "Q4"
    ],
    "datasets": [
      {
        "label": "Users",
        "data": [
          50,
          60,
          70,
          180
        ]
      },
      {
        "label": "Revenue",
        "data": [
          100,
          200,
          300,
          400
        ]
      }
    ]
  }
};

// Make the API request using callback
console.log('Making request to Chart Generator API...\n');

api.execute(query, function (error, data) {
    if (error) {
        console.error('Error occurred:');
        if (error.error) {
            console.error('Message:', error.error);
            console.error('Status:', error.status);
        } else {
            console.error(JSON.stringify(error, null, 2));
        }
        return;
    }

    console.log('Response:');
    console.log(JSON.stringify(data, null, 2));
});
