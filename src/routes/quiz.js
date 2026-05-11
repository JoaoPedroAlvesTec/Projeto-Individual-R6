var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.get("/pergunta/:id", function (req, res) {
    quizController.buscarPergunta(req, res);
});

router.get("/minhasEscolhas/:idUsuario", function(req,res){
    quizController.buscarMinhasEscolhas(req,res);
});

router.get("/verificar/:idUsuario", function (req, res) {
    quizController.verificarTentativa(req, res);
});

router.post("/resposta", function (req, res) {
    quizController.salvarResposta(req, res);
});

router.post("/tentativa", function (req, res) {
    quizController.criarTentativa(req, res);
});

module.exports = router;