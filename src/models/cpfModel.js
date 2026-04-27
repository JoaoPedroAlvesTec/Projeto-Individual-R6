var database = require("../database/config");


function listar() {
  var instrucaoSql = `SELECT cpf FROM usuario`;

  return database.executar(instrucaoSql);
}

module.exports = { listar };