var express = require('express');
var apiRoutes = express.Router();

/*var GetAllOrganizations = require("./org/GetAllOrganizations");
var GetOrganization = require("./org/GetOrganization");
var AddOrganization = require("./org/AddOrganization");
var RemoveOrganization = require("./org/RemoveOrganization");

var GetAllUsers = require("./user/GetAllUsers");
var GetUser = require("./user/GetUser");
var AddUser = require("./user/AddUser");
var RemoveUser = require("./user/RemoveUser");*/

var GetAllDevices = require("./device/GetAllDevices");
//var GetDevice = require("./device/GetDevice");
var AddDevice = require("./device/AddDevice");
var RemoveDevice = require("./device/RemoveDevice");
var AssignDevice = require("./device/AssignDevice");
var UnassignDevice = require("./device/UnassignDevice");

/*apiRoutes.get("/org", GetAllOrganizations);
apiRoutes.get("/org/:orgid", GetOrganization);
apiRoutes.post("/org, AddOrganization);
apiRoutes.delete("/org/:orgid", RemoveOrganization);

apiRoutes.get("/user", GetAllUsers);
apiRoutes.get("/user/:userid", GetUser);
apiRoutes.post("/user, AddUser);
apiRoutes.delete("/user/:userid", RemoveUser);*/

apiRoutes.get("/device", GetAllDevices);
//apiRoutes.get("/device/:deviceid", GetDevice);
apiRoutes.post("/device", AddDevice);
//apiRoutes.delete("/device/:deviceid", RemoveDevice);
apiRoutes.post("/device/:deviceid/assign", AssignDevice);
apiRoutes.post("/device/:deviceid/unassign", UnassignDevice);

module.exports = apiRoutes;