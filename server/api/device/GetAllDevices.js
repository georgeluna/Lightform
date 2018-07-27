"use strict";

var dbAccess = require('../../database/DBAccess');

module.exports = function(req, res){
	var selectOptions = {
		sql: 'SELECT id, hostname, model, serial FROM devices where org_id = ?',
		values: [req.param('orgid')],
		rowsAsArray: false
	};
	
	if(req.param('page') !== undefined && req.param('page') !== null){
		selectOptions.sql += ' LIMIT ?,5';
		selectOptions.values.push(parseInt(req.param('page')) * 5);
	};
	
	dbAccess.execute(selectOptions, function(err, results) {
		if(err) res.status(500).send({
			success: false,
			message: 'Internal server error.'
		});
		else res.status(200).send({
			success: true,
			data: results
		});
	});
};