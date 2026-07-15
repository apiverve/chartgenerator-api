/**
 * Chart Generator API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the Chart Generator API.
 * API Documentation: https://docs.apiverve.com/ref/chartgenerator
 */

const API_KEY = process.env.APIVERVE_API_KEY || 'YOUR_API_KEY_HERE';
const API_URL = 'https://api.apiverve.com/v1/chartgenerator';

/**
 * Make a POST request to the Chart Generator API
 */
async function callChartGeneratorAPI() {
  try {
    // Request body
    const requestBody &#x3D; {
    &quot;type&quot;: &quot;bar&quot;,
    &quot;labels&quot;: [
        &quot;Q1&quot;,
        &quot;Q2&quot;,
        &quot;Q3&quot;,
        &quot;Q4&quot;
    ],
    &quot;datasets&quot;: [
        {
            &quot;name&quot;: &quot;Sales&quot;,
            &quot;values&quot;: [
                50,
                60,
                70,
                180
            ]
        },
        {
            &quot;name&quot;: &quot;Revenue&quot;,
            &quot;values&quot;: [
                100,
                200,
                300,
                400
            ]
        }
    ],
    &quot;title&quot;: &quot;Quarterly Report&quot;
};

    const response = await fetch(API_URL, {
      method: 'POST',
      headers: {
        'x-api-key': API_KEY,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(requestBody)
    });

    // Check if response is successful
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    // Check API response status
    if (data.status === 'ok') {
      console.log('✓ Success!');
      console.log('Response data:', data.data);
      return data.data;
    } else {
      console.error('✗ API Error:', data.error || 'Unknown error');
      return null;
    }

  } catch (error) {
    console.error('✗ Request failed:', error.message);
    return null;
  }
}

// Run the example
callChartGeneratorAPI()
  .then(result => {
    if (result) {
      console.log('\n📊 Final Result:');
      console.log(JSON.stringify(result, null, 2));
    }
  });
