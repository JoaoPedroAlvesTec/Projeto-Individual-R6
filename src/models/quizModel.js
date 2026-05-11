var database = require("../database/config");


function buscarPergunta(idPergunta) {

    console.log("ACESSEI QUIZ MODEL - buscarPergunta");

    var instrucaoSql = `
        SELECT 
            p.texto AS pergunta,
            a.id_alternativa,
            a.texto,
            a.descricao,
            a.img
        FROM pergunta p
        JOIN alternativa a 
            ON p.id_pergunta = a.fk_id_pergunta
        WHERE p.id_pergunta = ${idPergunta};
    `;

    console.log("Executando SQL:\n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMinhasEscolhas(idUsuario) {

    console.log("ACESSEI QUIZ MODEL - buscarMinhasEscolhas");

    var instrucaoSql = `
    SELECT
        alternativa.* 
    FROM alternativa 
        join resposta on alternativa.id_alternativa = resposta.fk_id_alternativa
        join tentativa on resposta.fk_id_tentativa = tentativa.id_tentativa
        join usuario on tentativa.fk_id_usuario = usuario.id_usuario
    where id_usuario = ${idUsuario};
    `;

    console.log("Executando SQL:\n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function salvarResposta(idTentativa, idAlternativa) {

    console.log("ACESSEI QUIZ MODEL - salvarResposta");

    var instrucaoSql = `
        INSERT INTO resposta (fk_id_tentativa, fk_id_alternativa)
        VALUES (${idTentativa}, ${idAlternativa});
    `;

    console.log("Executando SQL:\n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function criarTentativa(idUsuario) {

    console.log("ACESSEI QUIZ MODEL - criarTentativa");

    var instrucaoSql = `
        INSERT INTO tentativa (data_tentativa, fk_id_usuario)
        VALUES (CURDATE(), ${idUsuario});
    `;

    console.log("Executando SQL:\n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function verificarTentativa(idUsuario) {

    var instrucaoSql = `
        SELECT * FROM tentativa 
        WHERE fk_id_usuario = ${idUsuario};
    `;

    return database.executar(instrucaoSql);
}

module.exports = {
    buscarPergunta,
    salvarResposta,
    buscarMinhasEscolhas,
    verificarTentativa,
    criarTentativa
};