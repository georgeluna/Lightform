var express     = require('express');
var app         = express();
var bodyParser  = require('body-parser');
var morgan      = require('morgan');

var api = require('./api');
var config = require('./app-config');

var port = 8080;

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

app.use(morgan('dev'));

app.use('/api', api);

app.listen(port);

console.log('The Lightform Test API server is now accessible at http://localhost:' + port);