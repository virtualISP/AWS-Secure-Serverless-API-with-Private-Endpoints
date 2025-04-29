import os
import json
from datetime import datetime
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['TABLE_NAME'])

def lambda_handler(event, context):
    print("Received event:", json.dumps(event))  # 👈 Logs the full event for debugging

    try:
        # Use .get and handle case where body might be None
        raw_body = event.get('body', '{}')
        body = json.loads(raw_body)

        if 'id' not in body or 'data' not in body:
            return {
                'statusCode': 400,
                'body': json.dumps({'error': 'Missing required fields: id or data'})
            }

        item = {
            'id': body['id'],
            'data': body['data'],
            'timestamp': datetime.now().isoformat()
        }

        table.put_item(Item=item)

        return {
            'statusCode': 200,
            'body': json.dumps({'message': 'Item saved', 'id': body['id']})
        }

    except Exception as e:
        print("Error occurred:", str(e))  # 👈 log actual error
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
