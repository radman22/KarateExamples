function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'staging') {
    config.apiUrl = 'https://payment-adyen-staging.whitewall.com/'
    config.jsonApiUrl = 'https://api.webapp-stag.whitewall.com/jsonApi/user/'
    config.jsonApiCartUrl = 'https://api.webapp-stag.whitewall.com/jsonApi/cart/'
    config.userEmail = 'xxxxxx'
    config.userpassword ='xxxxxx'
  } else if (env == 'prod') {
    // customize
  }
  karate.configure('headers', {Authorization: 'Basic xxxxxx'})
  return config;
}