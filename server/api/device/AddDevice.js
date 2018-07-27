"use strict";

var dbAccess = require('../../database/DBAccess');

module.exports = function(req, res){
	var insertOptions = {
		sql: "INSERT INTO devices SET ?",
		values: {
			hostname: req.body.hostname,
			org_id: req.body.orgid,
			model: req.body.model,
			serial: req.body.serial,
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
			message: 'Device ' + req.body.serial + ' has been successfully added to the organization.',
			data: {
				deviceid: results.insertId
			}
		});
	});
};