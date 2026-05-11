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

function tentativasTotal(){
    console.log("ACESSEI graficosModel - Kpi1");

    var instrucaoSql = `
    select count(id_tentativa) as tentativas
    from tentativa;
    `;

    return database.executar(instrucaoSql);
}

function maisEscolhida() {

    console.log("ACESSEI graficosModel - Kpi2");

    var instrucaoSql = `
    SELECT 
    p.id_pergunta,
    a.texto AS alternativa,
    COUNT(r.id_respostas) AS total
  FROM pergunta p
    JOIN alternativa a 
    ON a.fk_id_pergunta = p.id_pergunta
    LEFT JOIN resposta r 
    ON r.fk_id_alternativa = a.id_alternativa
    GROUP BY p.id_pergunta, a.id_alternativa
    order by total desc
limit 1;
    `;

    return database.executar(instrucaoSql);
}

function menosEscolhida() {

    console.log("ACESSEI graficosModel - Kpi3");

    var instrucaoSql = `
    SELECT 
    p.id_pergunta,
    a.texto AS alternativa,
    COUNT(r.id_respostas) AS total
  FROM pergunta p
    JOIN alternativa a 
    ON a.fk_id_pergunta = p.id_pergunta
    LEFT JOIN resposta r 
    ON r.fk_id_alternativa = a.id_alternativa
    GROUP BY p.id_pergunta, a.id_alternativa
    order by total
    limit 1;
    `;

    return database.executar(instrucaoSql);
}

function estatisticasGeral() {

    console.log("ACESSEI graficosModel - estatisticasGeral");

    var instrucaoSql = `
        SELECT 
    p.id_pergunta,
    a.texto AS alternativa,
    COUNT(r.id_respostas) AS total
  FROM pergunta p
    JOIN alternativa a 
    ON a.fk_id_pergunta = p.id_pergunta
    LEFT JOIN resposta r 
    ON r.fk_id_alternativa = a.id_alternativa
    GROUP BY p.id_pergunta, a.id_alternativa
    HAVING total = (
    SELECT MAX(contagem)
    FROM (
        SELECT COUNT(r2.id_respostas) AS contagem
        FROM alternativa a2
        LEFT JOIN resposta r2 
            ON r2.fk_id_alternativa = a2.id_alternativa
        WHERE a2.fk_id_pergunta = p.id_pergunta
        GROUP BY a2.id_alternativa
    ) AS sub
)
ORDER BY p.id_pergunta;   
    `;

    console.log("Executando SQL:\n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    estatisticasPergunta,
    estatisticasGeral,
    tentativasTotal,
    menosEscolhida,
    maisEscolhida
};