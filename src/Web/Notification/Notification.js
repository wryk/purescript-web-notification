exports.createImpl = function (title, options) {
	return new Notification(title, options);
}

exports.permissionImpl = function () {
	return Notification.permission;
}

exports.requestPermissionImpl = function (unit, callback) {
	Notification.requestPermission(callback);
	return unit;
}

// exports.bodyImpl = function (notification) {
// 	return notification.body;
// };
//
// exports.dataImpl = function (notification) {
// 	return notification.data;
// };
//
// exports.dirImpl = function (notification) {
// 	return notification.dir;
// };
//
// exports.iconImpl = function (notification) {
// 	return notification.icon;
// };
//
// exports.langImpl = function (notification) {
// 	return notification.lang;
// };
//
// exports.tagImpl = function (notification) {
// 	return notification.tag;
// };
//
// exports.titleImpl = function (notification) {
// 	return notification.title;
// };
