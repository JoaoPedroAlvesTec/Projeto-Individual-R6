var express = require("express");
var router = express.Router();

var chatController = require("../controllers/chatController");

router.get("/listar", function (req, res) {
    chatController.listar(req, res);
});

router.get("/listar/:idUsuario", function (req, res) {
    chatController.listarPorUsuario(req, res);
});

router.get("/pesquisar/:descricao", function (req, res) {
    chatController.pesquisarDescricao(req, res);
});

router.post("/publicar/:idUsuario", function (req, res) {
    chatController.publicar(req, res);
});

router.put("/editar/:idAviso", function (req, res) {
    chatController.editar(req, res);
});

router.delete("/deletar/:idAviso", function (req, res) {
    chatController.deletar(req, res);
});

module.exports = router;