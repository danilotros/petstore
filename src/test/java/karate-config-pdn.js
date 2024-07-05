function fn() {
    var microsoftTokenAuth = karate.properties['karate.microsoftTokenAuth'];
    var config = {
        urlBase: 'https://petstore.swagger.io/v2/',
        microsoftTokenAuth:microsoftTokenAuth
    };
    return config;
}