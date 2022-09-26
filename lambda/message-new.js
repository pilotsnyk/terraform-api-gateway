const { DynamoDB } = require('aws-sdk');

const endpoint = process.env.DYNAMODB_ENDPOINT
console.log(endpoint);

const options = {
  region: 'eu-west-1',
  endpoint: endpoint
};

exports.handler = (event, context, callback) => {
  
  var response = {
    "statusCode": 200,
    "headers": {
    "Content-Type": "*/*"
    }
  };
  
  const { UserId:userId, MessageText:message } = JSON.parse(event.body);
  
  console.log(userId);
  console.log(message);
  console.log('event', event)
   
  const dynamo = new DynamoDB(options);
  const dbClient = new DynamoDB.DocumentClient({ service: dynamo })
  
  const timestamp = new Date().toISOString();
  
  const params = {
    TableName: 'MessageHistory',
    Item:{
      UserId: userId,
      Timestamp: timestamp,
      MessageText: message
    }
  };
  dbClient.put(params, (err, data) => {
    if (err) {
      callback(Error("Unable to add item. Error JSON:", JSON.stringify(err, null, 2)));
    } else {
      response.body = "Staus Code: 200, item successfully put, " + "UserId:" + userId;
      callback(null, response);
    }
  });
};