var express = require("express");
var router = express.Router();

var graficosController = require("../controllers/graficosController");

router.get("/estatisticas/:idPergunta", function (req, res) {
    graficosController.estatisticasPergunta(req, res);
});

router.get("/estatisticas-geral", function (req, res) {
    graficosController.estatisticasGeral(req, res);
});
router.get("/tentativasTotal", function (req, res) {
    graficosController.tentativasTotal(req, res);
});
router.get("/maisEscolhida", function (req, res) {
    graficosController.maisEscolhida(req, res);
});
router.get("/menosEscolhida", function (req, res) {
    graficosController.menosEscolhida(req, res);
});

module.exports = router;