CREATE database R6;
USE R6;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    email VARCHAR(95) UNIQUE NOT NULL,
    senha VARCHAR(45) NOT NULL,
    img_usuario VARCHAR(100) DEFAULT '../assets/imgs/logo_png.png'
);

CREATE TABLE resultado (
    id_resultado INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL,
    img VARCHAR(255) NOT NULL
);
CREATE TABLE pergunta (
    id_pergunta INT AUTO_INCREMENT PRIMARY KEY,
    texto VARCHAR(45) NOT NULL
);

CREATE TABLE chat (
	id_chat INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(150),
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE tentativa (
    id_tentativa INT AUTO_INCREMENT PRIMARY KEY,
    data_tentativa DATE NOT NULL,
    fk_id_usuario INT UNIQUE NOT NULL,
    fk_id_resultado INT,
    CONSTRAINT fk_usuario_tentativa 
        FOREIGN KEY (fk_id_usuario) 
        REFERENCES usuario(id_usuario),
	CONSTRAINT fk_tentativa_resultado
		FOREIGN KEY (fk_id_resultado)
        REFERENCES resultado(id_resultado)
);

CREATE TABLE alternativa (
    id_alternativa INT AUTO_INCREMENT PRIMARY KEY,
    texto VARCHAR(45) NOT NULL,
    descricao VARCHAR(70),
    peso int,
    img VARCHAR(200),
    fk_id_pergunta INT NOT NULL,
    CONSTRAINT fk_pergunta_alternativa 
        FOREIGN KEY (fk_id_pergunta) 
        REFERENCES pergunta(id_pergunta)
);

CREATE TABLE resposta (
    id_respostas INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_tentativa INT NOT NULL,
    fk_id_alternativa INT NOT NULL,
    CONSTRAINT fk_tentativa_resposta 
        FOREIGN KEY (fk_id_tentativa) 
        REFERENCES tentativa(id_tentativa),
        
    CONSTRAINT fk_alternativa_resposta 
        FOREIGN KEY (fk_id_alternativa) 
        REFERENCES alternativa(id_alternativa)
);





INSERT INTO resultado (nome, descricao, img) VALUES
('SUP 1','Você é o suporte principal do time. Seu foco está em ajudar execuções, abrir espaço com utilidade e garantir que o time consiga executar estratégias com segurança.','../assets/imgs/soulz.webp'),

('SUP 2','Você joga focado em informação e cobertura. Seu estilo prioriza drones, câmeras, flank watch e suporte estratégico para manter o controle do mapa.','../assets/imgs/paluh.jpg'),

('IGL','Você tem perfil de líder. Costuma coordenar estratégias, adaptar táticas durante a partida e organizar o ritmo do time em situações difíceis.','../assets/imgs/lagonis.webp'),

('FLEX','Você é adaptável e consegue assumir diferentes funções dependendo da necessidade do time. Seu estilo é equilibrado e versátil.','../assets/imgs/alemao.jpg'),

('ENTRY','Você gosta de agressividade e impacto imediato. Seu foco está em abrir espaço, buscar eliminações rápidas e pressionar o adversário.','../assets/imgs/nesk.jpg');

INSERT INTO pergunta (texto) VALUES
('Qual personagem você jogaria no ataque?'),
('Qual personagem você jogaria na defesa?'),
('Qual mapa você jogaria?'),
('Qual arma você usaria no ataque?'),
('Qual arma você usaria na defesa?'),
('Qual sua melhor habilidade'),
('Qual utilitário você usaria no ataque?'),
('Qual utilitário você usaria na defesa?'),
('Qual gadget você usaria no ataque?'),
('Qual gadget você usaria na defesa?');

INSERT INTO alternativa (texto, descricao, peso, img, fk_id_pergunta) VALUES 

-- PERGUNTA 1
('Buck', 'Versátil em qualquer estratégia', 4, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/3k68pZu62GPbCAFOSCej9a/3c3d3da1f7109a396fb59dcf06c5c4c8/r6-operators-list-buck.png', 1),
('Ash', 'Entrada rápida e agressiva', 5, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/QOEBDfqjtUxVBc31l8L9f/4d9b112565baf81d56d69279b95cd463/r6-operators-list-ash_317253.png', 1),
('Thermite', 'Abre paredes principais para o time', 1, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/3NQW8lJVslVSaYSiBlAleU/09fd8e3e946f2e71f39182b9ff18dd77/r6-operators-list-thermite.png', 1),
('Dokkaebi', 'Coordena pressão e informação', 3, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/7fjUupLXClpcdTyqdvPv24/e4492917c18682ef09f9b0445176b2f2/r6-operators-list-dokkaebi.png', 1),
('Zero', 'Coleta informação e cobre flancos', 2, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/24jDQIfDdVMLX5K54pKNe5/58dec3b1e7d32a637bc76560e0cf0385/r6s-operator-list-zero.png', 1),

-- PERGUNTA 2
('Jäger', 'Busca trocação e roam agressivo', 5, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/4kMW2lcoewGifRWbvQVjKy/8f974b5d26db81dc823ea602e31d6273/r6-operators-list-jager.png', 2),
('Mute', 'Controle estratégico do mapa', 3, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/4BWoDVmdDsgrI071YJwqyF/4bcf11da1e22bda96d130a0f0d4d5b48/r6-operators-list-mute.png', 2),
('Doc', 'Cura os aliados', 1, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/2sCxLIpS9I19PKRz44Phj9/4f96411a556cc41597b8b3e83260cd21/r6-operators-list-doc.png', 2),
('Lesion', 'Adaptação e cobertura dinâmica', 4, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/3woPDn0yMuXfkr2RYoymFj/1e7412e4003aa2121b37dd11cfbb60e2/r6-operators-list-lesion.png', 2),
('Maestro', 'Informação constante com câmeras', 2, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/6QNXf9qRkqzOdsprj2SWgI/0c4cc3b9423cada4fed0ba5ae2c9c722/r6-operators-list-maestro.png', 2),

-- PERGUNTA 3
('Border', 'Trocação intensa e entrada rápida', 5, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/4hqsrL3cokFqedkfjiEaGf/655acbe5ae4ffab54f742d17f929d2af/R6S_Maps_Border_EXT.jpg', 3),
('Bank', 'Informação e rotação são essenciais', 2, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/6ilgtuzucX7hEu2MvjhRtp/c7c7e63cff53c8b2192fdec68a736619/R6S_Maps_Bank_EXT.jpg', 3),
('Consulate', 'Exige adaptação constante', 4, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/6PR2sBla9E6TNurVUfJ0mc/5c9b8d1b0da4bad3a577104f2f9a9291/ModernizedMap_Consulate_meta.jpg', 3),
('Oregon', 'Mapa equilibrado para estratégia', 3, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/1FoLr9Hf4oucDtzyQ48uFD/45ed70b771671e73871fd7d3378bbeb6/r6s_maps_oregon_main.jpg', 3),
('Clubhouse', 'Execução organizada e suporte forte', 1, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/1vCw5eD2XzxZlv6Au1gtui/06a84bacaacab62937dd6d4d8ae393c7/R6S_Maps_ClubHouse_EXT.jpg', 3),

-- PERGUNTA 4
('R4-C', 'Alta agressividade e entrada rápida', 5, '../assets/imgs/r4c.png', 4),
('AK-12', 'Estabilidade para coordenar o time', 2, '../assets/imgs/ak12.png', 4),
('F-2', 'Trocação rápida e agressiva', 4, '../assets/imgs/f2.png', 4),
('L85A2', 'Consistente e segura', 3, '../assets/imgs/l85.png', 4),
('TYPE-89', 'Controle defensivo seguro', 1, '../assets/imgs/type89.png', 4),


-- PERGUNTA 5
('MP5', 'Controle de informação e ângulos', 2, '../assets/imgs/mp5.png', 5),
('MP7', 'Consistente em trocações', 4, '../assets/imgs/mp7.png', 5),
('UMP-45', 'Controle e leitura de jogo', 1, '../assets/imgs/ump45.png', 5),
('T-5 SMG', 'Equilibrada em qualquer situação', 3, '../assets/imgs/t5.png', 5),
('VECTOR', 'Alta cadencia para trocações', 5, '../assets/imgs/vector.png', 5),

-- PERGUNTA 6
('Trocação', 'Pressão ofensiva', 5, 'https://cdn-icons-png.flaticon.com/512/1022/1022348.png', 6),
('Informação', 'Câmeras, drones e calls', 2, 'https://cdn-icons-png.flaticon.com/512/46/46075.png', 6),
('Adaptação', 'Flexibilidade total', 4, 'https://cdn-icons-png.flaticon.com/512/38/38043.png', 6),
('Estratégias', 'Controla o ritmo da partida', 3, 'https://cdn-icons-png.flaticon.com/512/1278/1278206.png', 6),
('Suporte', 'Ajuda execuções e cobertura', 1, 'https://cdn-icons-png.flaticon.com/512/4233/4233839.png', 6),

-- PERGUNTA 7
('Flashbang', 'Versátil para qualquer entrada', 4, 'https://static.wikia.nocookie.net/rainbowsix/images/d/d9/R6S_Stun_Grenade.png/revision/latest?cb=20220525145604', 7),
('Breach Charge', 'Abertura de paredes', 2, 'https://static.wikia.nocookie.net/rainbowsix/images/0/05/R6S_Breach_Charge.png/revision/latest?cb=20220525145137', 7),
('Frag Grenade', 'Abertura agressiva', 5, 'https://static.wikia.nocookie.net/rainbowsix/images/a/a6/R6S_Frag_Grenade.png/revision/latest?cb=20220525145213', 7),
('Smoke Grenade', 'Cobertura para execute', 1, 'https://static.wikia.nocookie.net/rainbowsix/images/4/4e/R6S_Smoke_Grenade.png/revision/latest?cb=20220525145555', 7),
('Hard Breach', 'Abertura de paredes reforçadas', 3, 'https://static.wikia.nocookie.net/rainbowsix/images/8/83/R6S_Hard_Breach_Charge.png/revision/latest?cb=20220525145222', 7),

-- PERGUNTA 8
('C4', 'Play agressiva e eliminação rápida', 5, 'https://static.wikia.nocookie.net/rainbowsix/images/e/e1/R6S_Nitro_Cell.png/revision/latest?cb=20220525145259', 8),
('Escudo expansível', 'Fortalece posição defensiva', 1, 'https://static.wikia.nocookie.net/rainbowsix/images/b/b7/R6S_Deployable_Shield_v2.png/revision/latest?cb=20220525145158', 8),
('Granada de impacto', 'Rotação e adaptação', 4, 'https://static.wikia.nocookie.net/rainbowsix/images/f/f5/R6S_Impact_Grenade.png/revision/latest?cb=20220525145223', 8),
('Arame farpado', 'Controle de movimentação', 3, 'https://static.wikia.nocookie.net/rainbowsix/images/8/80/R6S_Barbed_Wire.png/revision/latest?cb=20220525145131', 8),
('Câmera à prova de bala', 'Coleta informação constante', 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjQHSTuEKXfNM5KygDGHDNO-Exv5v5LNNGXg&s', 8),

-- PERGUNTA 9
('Candela (Ying)', 'Entrada explosiva no bomb', 5, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/6ZVB1OJxNgs0pR0Fd7Kzt0/74721fe9fd743167508f98dc280a17a3/Y2S2_BADGE_Ying_L.png', 9),
('Argus Launcher (Zero)', 'Informação avançada', 2, 'https://static.wikia.nocookie.net/rainbowsix/images/d/d6/ZeroIconN.png/revision/latest?cb=20250202202733', 9),
('Airjab Launcher (Nomad)', 'Controle e adaptação', 4, 'https://static.wikia.nocookie.net/rainbowsix/images/4/4f/NomadIconN.png/revision/latest?cb=20240714033121', 9),
('Logic Bomb (Dokkaebi)', 'Coordenação e pressão global', 3, 'https://static.wikia.nocookie.net/rainbowsix/images/2/2b/DokkaebiIconN.png/revision/latest?cb=20240713075919', 9),
('SELMA Aqua Breacher (Ace)', 'Abre espaço para o time', 1, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/dgG7GmXY1HgfeEE2gI1H9/06bd3917c8fc19f61654490019ef25fb/Y5S2_BADGE_Ace_L.png', 9),

-- PERGUNTA 10
('GU Mine (Lesion)', 'Versátil e adaptável', 4, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/2CWYSySnPAhsOHdq2OLSjv/f9e54debcfa0c8fe76012d9097b98e6e/Y2S2_BADGE_Lesion_L.png', 10),
('Welcome Mat (Frost)', 'Punir avanço inimigo', 5, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/1OWFtfiEXleLSENciCSQQR/8fcced59c0125073e506f2dee0201015/Y1S1_BADGE_Frost_L.png', 10),
('Signal Disruptor (Mute)', 'Controle tático do round', 3, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/3exeHnxH1tmUmQTequWRKa/e1b6c6f057eb24722dd7860af0276316/Y0R6_BADGE_Mute_L.png', 10),
('Black Mirror (Mira)', 'Defesa estratégica do bomb', 1, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/u1KR6aogjLncAtaVOciTc/ba730583f9c20cad6d3ca996d366a707/Y2S1_BADGE_Mira_L.png', 10),
('Evil Eye (Maestro)', 'Informação e suporte constante', 2, 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/XK43imgD0tc0xrk0tgTCQ/0402cc95cbd525debafa1aab0fdd8385/Y3S2_BADGE_Maestro_L.png', 10);