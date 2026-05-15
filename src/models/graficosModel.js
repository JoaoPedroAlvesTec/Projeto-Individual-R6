var database = require("../database/config");


function estatisticasPergunta(idPergunta) {

    console.log("ACESSEI graficosModel - estatisticasPergunta");

    var instrucaoSql = `
        SELECT 
            a.texto AS alternativa,
            COUNT(r.id_respostas) AS total
        FROM alternativa a
        LEFT JOIN resposta r 
            ON a.id_alternativa = r.fk_id_alternativa
        WHERE a.fk_id_pergunta = ${idPergunta}
        GROUP BY a.id_alternativa, a.texto;
    `;

    console.log("Executando SQL:\n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function tentativasTotal() {
    console.log("ACESSEI graficosModel - Kpi1");

    var instrucaoSql = `
    select count(id_tentativa) as tentativas
    from tentativa;
    `;

    return database.executar(instrucaoSql);
}

function maiorResultado() {

    console.log("ACESSEI graficosModel - Kpi2");

    var instrucaoSql = `
    SELECT 
    resultado.nome,
    COUNT(*) AS quantidade
        FROM tentativa
        JOIN resultado
    ON tentativa.fk_id_resultado = resultado.id_resultado
        GROUP BY resultado.nome
    ORDER BY quantidade DESC
    LIMIT 1;
    `;

    return database.executar(instrucaoSql);
}

function menorResultado() {

    console.log("ACESSEI graficosModel - Kpi3");

    var instrucaoSql = `
    SELECT 
    resultado.nome,
    COUNT(*) AS quantidade
    FROM tentativa
    JOIN resultado
    ON tentativa.fk_id_resultado = resultado.id_resultado
    GROUP BY resultado.nome
    ORDER BY quantidade ASC
    LIMIT 1;
    `;

    return database.executar(instrucaoSql);
}

function estatisticasGeral() {

    console.log("ACESSEI graficosModel - estatisticasGeral");

    var instrucaoSql = `
        SELECT 
    r.nome AS perfil,
    COUNT(t.fk_id_resultado) AS quantidade_absoluta,
        ROUND((COUNT(t.fk_id_resultado) / (SELECT COUNT(*) FROM tentativa)) * 100, 1) AS porcentagem
        FROM tentativa t
        JOIN resultado r ON t.fk_id_resultado = r.id_resultado
    GROUP BY t.fk_id_resultado, r.nome
    ORDER BY porcentagem DESC;`;

    console.log("Executando SQL:\n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    estatisticasPergunta,
    estatisticasGeral,
    tentativasTotal,
    menorResultado,
    maiorResultado
};