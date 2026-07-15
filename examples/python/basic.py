"""
Chart Generator API - Basic Usage Example

This example demonstrates the basic usage of the Chart Generator API.
API Documentation: https://docs.apiverve.com/ref/chartgenerator
"""

import os
import requests
import json

API_KEY = os.getenv('APIVERVE_API_KEY', 'YOUR_API_KEY_HERE')
API_URL = 'https://api.apiverve.com/v1/chartgenerator'

def call_chartgenerator_api():
    """
    Make a POST request to the Chart Generator API
    """
    try:
        # Request body
        request_body &#x3D; {
    &#x27;type&#x27;: &#x27;bar&#x27;,
    &#x27;labels&#x27;: [
        &#x27;Q1&#x27;,
        &#x27;Q2&#x27;,
        &#x27;Q3&#x27;,
        &#x27;Q4&#x27;
    ],
    &#x27;datasets&#x27;: [
        {
            &#x27;name&#x27;: &#x27;Sales&#x27;,
            &#x27;values&#x27;: [
                50,
                60,
                70,
                180
            ]
        },
        {
            &#x27;name&#x27;: &#x27;Revenue&#x27;,
            &#x27;values&#x27;: [
                100,
                200,
                300,
                400
            ]
        }
    ],
    &#x27;title&#x27;: &#x27;Quarterly Report&#x27;
}

        headers = {
            'x-api-key': API_KEY,
            'Content-Type': 'application/json'
        }

        response = requests.post(API_URL, headers=headers, json=request_body)

        # Raise exception for HTTP errors
        response.raise_for_status()

        data = response.json()

        # Check API response status
        if data.get('status') == 'ok':
            print('✓ Success!')
            print('Response data:', json.dumps(data['data'], indent=2))
            return data['data']
        else:
            print('✗ API Error:', data.get('error', 'Unknown error'))
            return None

    except requests.exceptions.RequestException as e:
        print(f'✗ Request failed: {e}')
        return None

if __name__ == '__main__':
    print('📤 Calling Chart Generator API...\n')

    result = call_chartgenerator_api()

    if result:
        print('\n📊 Final Result:')
        print(json.dumps(result, indent=2))
    else:
        print('\n✗ API call failed')
