var quizModel = require("../models/quizModel");


function buscarPergunta(req, res) {
    var idPergunta = req.params.id;

    if (idPergunta == undefined) {
        res.status(400).send("Id da pergunta está undefined!");
    } else {

        quizModel.buscarPergunta(idPergunta)
            .then(function (resultado) {

                if (resultado.length > 0) {

                    res.json({
                        pergunta: resultado[0].pergunta,
                        alternativas: resultado.map(item => ({
                            id: item.id_alternativa,
                            texto: item.texto,
                            descricao: item.descricao,
                            img: item.img,
                            peso: item.peso
                        }))
                    });

                } else {
                    res.status(404).send("Pergunta não encontrada");
                }

            }).catch(function (erro) {
                console.log(erro);
                console.log("\nErro ao buscar pergunta:", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

function buscarMinhasEscolhas(req, res) {
    
    var idUsuario = req.params.idUsuario;

    if (idUsuario == undefined) {
        res.status(400).send("Id do usuario está undefined!");
    } else {

        quizModel.buscarMinhasEscolhas(idUsuario)
            .then(function (resultado) {

                if (resultado.length > 0) {

                    res.json({

                        alternativas: resultado.map(item => ({
                            id: item.id_alternativa,
                            texto: item.texto,
                            descricao: item.descricao,
                            img: item.img
                        })),

                        resultado: {
                            nome: resultado[0].resultado_nome,
                            descricao: resultado[0].resultado_descricao,
                            img: resultado[0].resultado_img
                        }

                    });

                } else {
                    res.status(404).send("Pergunta não encontrada");
                }

            }).catch(function (erro) {
                console.log(erro);
                console.log("\nErro ao buscar pergunta:", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

function verificarTentativa(req, res) {
    var idUsuario = req.params.idUsuario;

    if (idUsuario == undefined) {
        res.status(400).send("idUsuario undefined");
    } else {

        quizModel.verificarTentativa(idUsuario)
            .then(function (resultado) {

                if (resultado.length > 0) {
                    res.json({ jaFez: true });
                } else {
                    res.json({ jaFez: false });
                }

            }).catch(function (erro) {
                console.log(erro);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

function salvarResposta(req, res) {

    var idTentativa = req.body.id_tentativa;
    var idAlternativa = req.body.id_alternativa;

    if (idTentativa == undefined) {
        res.status(400).send("id_tentativa está undefined!");
    } else if (idAlternativa == undefined) {
        res.status(400).send("id_alternativa está undefined!");
    } else {

        quizModel.salvarResposta(idTentativa, idAlternativa)
            .then(function (resultado) {
                res.json(resultado);
            }).catch(function (erro) {
                console.log(erro);
                console.log("\nErro ao salvar resposta:", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
}


function criarTentativa(req, res) {

    var idUsuario = req.body.id_usuario;

    if (idUsuario == undefined) {
        res.status(400).send("id_usuario está undefined!");
    } else {

        quizModel.criarTentativa(idUsuario)
            .then(function (resultado) {

                res.json({
                    id_tentativa: resultado.insertId
                });

            }).catch(function (erro) {
                console.log(erro);
                console.log("\nErro ao criar tentativa:", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
}
function definirResultado(req, res){

    var id_resultado = req.body.id_resultado;
    var id_tentativa = req.body.id_tentativa;

    if (id_resultado == undefined) {

        res.status(400).send("id_resultado está undefined!");

    } else if (id_tentativa == undefined) {

        res.status(400).send("id_tentativa está undefined!");

    } else {

        quizModel.definirResultado(id_resultado, id_tentativa)

            .then(function (resultado) {

                res.status(200).json({
                    mensagem: "Resultado salvo com sucesso"
                });

            })

            .catch(function (erro) {

                console.log(erro);
                console.log("\nErro ao definir resultado:", erro.sqlMessage);

                res.status(500).json(erro.sqlMessage);

            });
    }
}

module.exports = {
    buscarPergunta,
    salvarResposta,
    buscarMinhasEscolhas,
    criarTentativa,
    verificarTentativa,
    definirResultado
};