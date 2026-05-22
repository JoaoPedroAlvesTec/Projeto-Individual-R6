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

function estatisticasResultado(usuario_resultado) {

    console.log("ACESSEI graficosModel - estatisticasResultado");

    var instrucaoSql = `
        SELECT 
            p.id_pergunta,
            p.texto AS pergunta,
            COUNT(r.id_respostas) AS total_escolhas,
            a.texto as texto
        FROM resposta r
        JOIN alternativa a 
            ON r.fk_id_alternativa = a.id_alternativa
        JOIN pergunta p 
            ON a.fk_id_pergunta = p.id_pergunta
        JOIN tentativa t 
            ON r.fk_id_tentativa = t.id_tentativa
        JOIN resultado re 
            ON t.fk_id_resultado = re.id_resultado
        WHERE re.nome = '${usuario_resultado}'
        GROUP BY 
            p.id_pergunta,
            p.texto,
            a.id_alternativa,
            a.texto
        HAVING COUNT(r.id_respostas) = (
            SELECT MAX(total_alt)
            FROM (
                SELECT COUNT(r2.id_respostas) AS total_alt
                FROM resposta r2
                JOIN alternativa a2 
                    ON r2.fk_id_alternativa = a2.id_alternativa
                JOIN tentativa t2 
                    ON r2.fk_id_tentativa = t2.id_tentativa
                JOIN resultado re2 
                    ON t2.fk_id_resultado = re2.id_resultado
                WHERE re2.nome = '${usuario_resultado}'
                AND a2.fk_id_pergunta = p.id_pergunta
                GROUP BY a2.id_alternativa
            ) AS subquery
        )
        ORDER BY p.id_pergunta;
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
    maiorResultado,
    estatisticasResultado
};

[]