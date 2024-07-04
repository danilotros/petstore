function fn() {
    var microsoftTokenAuth = karate.properties['karate.microsoftTokenAuth'];
    var config = {
        global: {
            access_token: microsoftTokenAuth
        },
    };
    return config;
}