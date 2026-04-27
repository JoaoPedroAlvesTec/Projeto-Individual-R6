var express = require("express");
var router = express.Router();

var cpfController = require("../controllers/cpfController"); 

router.get("/listar", function (req, res) {
    
    cpfController.listar(req, res); 
});

module.exports = router;