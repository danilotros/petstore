function fn() {
    var env = karate.env;
    var user = "postman";
    var password = "password";

    var result= karate.call('classpath:auth/feature/oauth.feature', {
        username: user,
        password: password
    });
    var config = {
        urlBase: 'https://petstore.swagger.io/v2/',
        microsoftTokenAuth:result.accessToken
    };
    if (env === 'qa') {
        config.urlBase = 'https://petstore.swagger.io/v2/';
    } else if (env === 'dev') {
        config.urlBase = 'https://petstore.swaggerioo.io/v2/';
    }
    print('karate-config.js loaded');
    return config;
}