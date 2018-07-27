"use strict";

var dbAccess = require('../../database/DBAccess');

module.exports = function(req, res){
	var insertOptions = {
		sql: "INSERT INTO assignments SET ?",
		values: {
			device_id: req.param('deviceid'),
			user_id: req.body.userid,
			org_id: req.body.orgid,
			access: req.body.access
		},
		rowsAsArray: false
	};
	
	dbAccess.execute(insertOptions, function(err, results) {
		if(err) res.status(500).send({
			success: false,
			message: 'Internal server error.'
		});
		else res.status(200).send({
			success: true,
			message: 'Device with ID of ' + req.param('deviceid') + ' has been successfully assigned to User with ID of ' + req.body.userid
		});
	});
};