"use strict";

var dbAccess = require('../../database/DBAccess');

module.exports = function(req, res){
	var deleteOptions = {
		sql: "DELETE FROM assignments WHERE device_id = ? AND user_id = ?",
		values: [
			req.param('deviceid'),
			req.body.userid
		],
		rowsAsArray: false
	};
	
	dbAccess.execute(deleteOptions, function(err, results) {
		if(err) res.status(500).send({
			success: false,
			message: 'Internal server error.'
		});
		else res.status(200).send({
			success: true,
			message: 'User with ID ' + req.body.userid + ' has been successfully unassigned from device with ID ' + req.param('deviceid')
		});
	});
};