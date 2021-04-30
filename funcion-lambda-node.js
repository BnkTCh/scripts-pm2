# se debe tener el rol de sns para escritura a todos los recursos.


var AWS = require('aws-sdk');
AWS.config.update({region: 'us-east-1'});

exports.handler = async (event) => {
    var body=JSON.parse(event.body);
    console.log(body.sms)
      var params = {
        Message: body.sms,
        TopicArn: 'arn:aws:sns:us-east-1:741297891242:bnksnsprueba'
    };
    var publishTextPromise = new AWS.SNS({apiVersion: '2010-03-31'}).publish(params).promise();
    publishTextPromise.then(
  function(data) {
    console.log(`Message ${params.Message} sent to the topic ${params.TopicArn}`);
    console.log("MessageID is " + data.MessageId);
  }).catch(
    function(err) {
    console.error(err, err.stack);
  });
    
   return publishTextPromise;
};
