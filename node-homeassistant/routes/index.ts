import express from "express";
var router = express.Router();

var api = require("../API-service");

router.get("/helloWorld", function (req: any, res: any) {
  api.helloWorld(req, res);
});

module.exports = router;
