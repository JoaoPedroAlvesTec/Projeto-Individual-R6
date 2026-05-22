var graficosModel = require("../models/graficosModel");


function estatisticasPergunta(req, res) {

    var idPergunta = req.params.idPergunta;

    if (idPergunta == undefined) {
        res.status(400).send("idPergunta undefined!");
        return;
    }

    graficosModel.estatisticasPergunta(idPergunta)
        .then(function (resultado) {
            res.json(resultado);
        })
        .catch(function (erro) {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function estatisticasResultado(req, res) {

    var usuario_resultado = req.params.usuario_resultado;

    if (usuario_resultado == undefined) {
        res.status(400).send("usuario_resultado undefined!");
        return;
    }

    graficosModel.estatisticasResultado(usuario_resultado)
        .then(function (resultado) {
            res.json(resultado);
        })
        .catch(function (erro) {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function estatisticasGeral(req, res) {

    graficosModel.estatisticasGeral()
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function tentativasTotal(req, res) {

    graficosModel.tentativasTotal()
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function maiorResultado(req, res) {

    graficosModel.maiorResultado()
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function menorResultado(req, res) {

    graficosModel.menorResultado()
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    estatisticasPergunta,
    estatisticasGeral,
    tentativasTotal,
    menorResultado,
    maiorResultado,
    estatisticasResultado
};