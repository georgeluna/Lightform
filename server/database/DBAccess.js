var mysql = require('mysql2');
var dbConfig = require('../app-config').dbConfig;
var dbConnectionPool = mysql.createPool(dbConfig);

var dbAccess = {
    execute: function(options, callback){
        dbConnectionPool.getConnection(function(connectErr, connection){
            if(connectErr){
                callback(connectErr, []);
                return;
            }
            
            connection.query(options.sql, options.values, function(queryErr, results){
                connection.release();
                if(queryErr){
                    callback(queryErr, []);
                    return;
                }
                
                callback(false, results);
            });
        });
    }
};

module.exports = dbAccess;
