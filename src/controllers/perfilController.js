var perfilModel = require("../models/perfilModel");

function carregarPerfil(req, res) {

    var idUsuario = req.params.id_usuario;

    if (idUsuario == undefined) {
        res.status(400).send("Id do usuario está undefined!");
    } else {

        perfilModel.carregarPerfil(idUsuario)
            .then(function (resultado) {
                res.status(200).json(resultado[0]);
            }).catch(function (erro) {
                console.log(erro);
                console.log("\nErro ao buscar pergunta:", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

function atualizarPerfil(req, res){

    let nome = req.body.nome;
    let email = req.body.email;
    let senha = req.body.senha;
    let img_usuario = req.body.img_usuario;
    let id_usuario = req.body.id_usuario;

    if(
        nome == undefined ||
        email == undefined ||
        senha == undefined ||
        img_usuario == undefined ||
        id_usuario == undefined
    ){
        res.status(400).send("Algum dado esta undefined");
    } else {
        perfilModel.atualizarPerfil(nome,email,senha,img_usuario,id_usuario)
        .then(resultado => {
            if(resultado.affectedRows > 0){
                res.status(200).json(resultado);

            } else {

                res.status(401).send("Senha incorreta");
          }
        })
        .catch(erro => {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
    }
}


module.exports = {
    carregarPerfil,
    atualizarPerfil
};