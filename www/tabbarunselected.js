module.exports = {
    setColorforUnselected: function (color, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "CDVTabBarUnselected", "setColorforUnselected", [color]);
    }
};
