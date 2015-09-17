module.exports = {
    setColorforUnselected: function (name, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "CDVTabBarUnselected", "setColorforUnselected", [name]);
    }
};
