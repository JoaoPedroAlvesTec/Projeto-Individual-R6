var express = require("express");
var router = express.Router();

var graficosController = require("../controllers/graficosController");

router.get("/estatisticas/:idPergunta", function (req, res) {
    graficosController.estatisticasPergunta(req, res);
});

router.get("/estatisticasResultado/:usuario_resultado", function (req, res) {
    graficosController.estatisticasResultado(req, res);
});

router.get("/estatisticas-geral", function (req, res) {
    graficosController.estatisticasGeral(req, res);
});
router.get("/estatisticas-geral", function (req, res) {
    graficosController.estatisticasGeral(req, res);
});
router.get("/tentativasTotal", function (req, res) {
    graficosController.tentativasTotal(req, res);
});
router.get("/maiorResultado", function (req, res) {
    graficosController.maiorResultado(req, res);
});
router.get("/menorResultado", function (req, res) {
    graficosController.menorResultado(req, res);
});

module.exports = router;