var express = require("express");
var router = express.Router();

var perfilController = require("../controllers/perfilController");

router.get("/carregarPerfil/:id_usuario", function (req, res) {
    perfilController.carregarPerfil(req, res);
});

router.put("/atualizarPerfil", function(req, res){
    perfilController.atualizarPerfil(req, res);
});

module.exports = router;