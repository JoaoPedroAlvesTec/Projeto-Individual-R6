var cpfModel = require("../models/cpfModel");

function listar(req, res) {
  cpfModel.listar().then((resultado) => {
    res.status(200).json(resultado);
  });
}

module.exports = {
    listar
};