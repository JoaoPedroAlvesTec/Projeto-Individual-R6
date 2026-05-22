var database = require("../database/config");

    function carregarPerfil(idUsuario){

        console.log("ACESSEI perfilModel - carregarPerfil");
        
            var instrucaoSql = `
            select nome, cpf, email, img_usuario, senha from usuario where id_usuario = ${idUsuario}`;
        
            console.log("Executando SQL:\n" + instrucaoSql);
            return database.executar(instrucaoSql);
    }

    function atualizarPerfil(nome,email,senha,img_usuario,id_usuario){
    console.log("ACESSEI perfilModel - atualizarPerfil");
    let instrucaoSql = `
        UPDATE usuario
        SET
            nome = '${nome}',
            email = '${email}',
            img_usuario = '${img_usuario}'
        WHERE
            id_usuario = ${id_usuario}
            AND senha = '${senha}';
    `;
    console.log(instrucaoSql);
    return database.executar(instrucaoSql);
}
module.exports = {
    carregarPerfil,
    atualizarPerfil
};