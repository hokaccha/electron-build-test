exports.handler = (event, context, callback) => {
  var AWS = require('aws-sdk');
  var codebuild = new AWS.CodeBuild();
  var body = JSON.parse(event.body);
  if (body.ref_type !== 'tag') {
    callback(null, { statusCode: 200 });
    return;
  }
  codebuild.startBuild({
    projectName: 'electron-build-test',
    sourceVersion: body.ref,
    environmentVariablesOverride: [
      { name: 'BUILD_VERSION', value: body.ref },
      { name: 'GITHUB_ACCESS_TOKEN', value: process.env.GITHUB_ACCESS_TOKEN },
    ],
  }, function(err) {
      callback(err, { statusCode: err ? 500 : 200 });
  });
};
