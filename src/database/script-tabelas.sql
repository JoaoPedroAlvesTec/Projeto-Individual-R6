CREATE DATABASE R6;
USE R6;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    email VARCHAR(95) UNIQUE NOT NULL,
    senha VARCHAR(45) NOT NULL
);

CREATE TABLE tentativa (
    id_tentativa INT AUTO_INCREMENT PRIMARY KEY,
    data_tentativa DATE NOT NULL,
    fk_id_usuario INT UNIQUE NOT NULL,
    CONSTRAINT fk_usuario_tentativa 
        FOREIGN KEY (fk_id_usuario) 
        REFERENCES usuario(id_usuario)
);

CREATE TABLE pergunta (
    id_pergunta INT AUTO_INCREMENT PRIMARY KEY,
    texto VARCHAR(45) NOT NULL
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

CREATE TABLE alternativa (
    id_alternativa INT AUTO_INCREMENT PRIMARY KEY,
    texto VARCHAR(45) NOT NULL,
    descricao VARCHAR(70),
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

INSERT INTO pergunta (texto) VALUES
('Qual personagem você jogaria no ataque?'),
('Qual personagem você jogaria na defesa?'),
('Qual mapa você prefere jogar?'),
('Em uma rodada difícil, qual seria sua prioridade?'),
('Como você costuma se posicionar durante a partida?'),
('Qual sua principal qualidade no jogo?'),
('Você prefere iniciar execuções ou dar suporte ao time?'),
('Como você reage quando o plano inicial falha?'),
('Qual habilidade você usaria?'),
('Qual gadget você usaria na defesa?');

INSERT INTO alternativa (texto, descricao, img, fk_id_pergunta) VALUES

('Sledge', 'Força e abertura', '../assets/imgs/sledge.avif', 1),
('Ash', 'Rápida e agressiva', '../assets/imgs/ash.avif', 1),
('Zofia', 'Equilibrada', '../assets/imgs/zofia.avif', 1),
('Hibana', 'Abertura estratégica', '../assets/imgs/hibana.avif', 1),
('Dokkaebi', 'Rastreamento', '../assets/imgs/dokkaebi.avif', 1),

('Jäger', 'Anti granadas', '../assets/imgs/jager.avif', 2),
('Smoke', 'Controle de área', '../assets/imgs/smoke.avif', 2),
('Bandit', 'Eletricidade', '../assets/imgs/bandit.avif', 2),
('Mute', 'Bloqueio eletrônico', '../assets/imgs/mute.avif', 2),
('Kapkan', 'Armadilhas', '../assets/imgs/kapkan.avif', 2),

('Oregon', 'Clássico e equilibrado', '../assets/imgs/oregon.jpg', 3),
('Clubhouse', 'Competitivo', '../assets/imgs/clubhouse.jpg', 3),
('Consulate', 'Verticalidade', '../assets/imgs/consulate.jpg', 3),
('Bank', 'Grande e tático', '../assets/imgs/bank.jpg', 3),
('Kafe', 'Combate fechado', '../assets/imgs/kafe.jpg', 3),

('R4-C', 'Alta cadência', '../assets/imgs/r4c.png', 4),
('AK-12', 'Muito dano', '../assets/imgs/ak12.png', 4),
('L85A2', 'Estável', '../assets/imgs/l85.png', 4),
('Type-89', 'Compacta', '../assets/imgs/type89.png', 4),
('F2', 'Precisão alta', '../assets/imgs/f2.png', 4),

('MP5', 'Equilibrada', '../assets/imgs/mp5.png', 5),
('UMP45', 'Controle fácil', '../assets/imgs/ump45.png', 5),
('MP7', 'Rápida', '../assets/imgs/mp7.png', 5),
('Vector', 'Alta cadência', '../assets/imgs/vector.png', 5),
('T-5 SMG', 'Muito forte', '../assets/imgs/t5.png', 5),

('Entry Fragger', 'Vai primeiro', '../assets/imgs/entry.jpg', 6),
('Suporte', 'Ajuda o time', '../assets/imgs/support.jpg', 6),
('Anchor', 'Defende o bomb', '../assets/imgs/anchor.jpg', 6),
('Roamer', 'Flanqueia inimigos', '../assets/imgs/roamer.jpg', 6),
('IGL', 'Líder estratégico', '../assets/imgs/igl.jpg', 6),

('Granada', 'Explosiva', 'https://static.wikia.nocookie.net/rainbowsix/images/a/a6/R6S_Frag_Grenade.png/revision/latest?cb=20220525145213', 7),
('Flashbang', 'Cega inimigos', 'https://static.wikia.nocookie.net/rainbowsix/images/f/f6/M84stungrenade.png/revision/latest?cb=20260227145400', 7),
('Smoke', 'Cobertura', 'https://static.wikia.nocookie.net/rainbowsix/images/d/d5/Smoke_Grenade.png/revision/latest/scale-to-width-down/1200?cb=20260227164233', 7),
('Claymore', 'Proteção traseira', 'https://static.wikia.nocookie.net/rainbowsix/images/0/02/R6S_Claymore.png/revision/latest?cb=20220525145152', 7),
('Drone', 'Informação', 'https://ubiservices.cdn.ubi.com/0d2ae42d-4c27-4cb7-af6c-2099062302bb/MtxAssetsDeployer/5b294898_4c26_5e0b_ec96_90a5fe4a1926.png?imwidth=640', 7),

('Arame farpado', 'Lentidão', 'https://static.wikia.nocookie.net/rainbowsix/images/8/80/R6S_Barbed_Wire.png/revision/latest?cb=20220525145131', 8),
('C4', 'Explosivo', 'https://static.wikia.nocookie.net/rainbowsix/images/e/e1/R6S_Nitro_Cell.png/revision/latest?cb=20220525145259', 8),
('Escudo', 'Cobertura', 'https://static.wikia.nocookie.net/rainbowsix/images/b/b7/R6S_Deployable_Shield_v2.png/revision/latest?cb=20220525145158', 8),
('Câmera', 'Visão extra', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5zHHGjPWnHSkc7hkX9vuXB8Y011Q56HM4AA&s', 8),
('Impact', 'Rotação rápida', 'https://static.wikia.nocookie.net/rainbowsix/images/f/f5/R6S_Impact_Grenade.png/revision/latest?cb=20220525145223', 8),

('R.O.U. Projector System (Sens)', 'Projeta uma parede de luz que bloqueia visão', 'https://cdna.artstation.com/p/assets/covers/images/050/716/256/large/maksym-bidnychenko-maksym-bidnychenko-23123.jpg?1655497398', 9),
('Cluster Charge (Fuze)', 'Dispara múltiplas granadas através de superfícies', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_0eFp_3vecEgd-cVcaKtTWjtRyuFB23_xAA&s', 9),
('Eyenox Model III (Jackal)', 'Rastreia pegadas inimigas para localizar alvos', 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/3ntMaBashgSGTlNnf8xT0v/b5f7e601d851c4308cd208deb07b1073/R6-operators-gadget-jackal.png', 9),
('Candela (Ying)', 'Libera múltiplos flashes para cegar inimigos', 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/12qs6GsjM988o3c7TmNcfa/36a79793938a6568f78562b5e518761d/R6-operators-gadget-ying.png', 9),
('Airjab Launcher (Nomad)', 'Arremessa inimigos e impede avanços agressivos', 'https://static.wikia.nocookie.net/rainbowsix/images/4/4d/Gadget_REACT_Airjab_Launcher.png/revision/latest?cb=20220124140557', 9),

('ADS (Jäger)', 'Neutraliza granadas antes de explodirem', 'https://static9.cdn.ubi.com/resource/en-US/game/rainbow6/siege/R6-operators-gadget-jager_229893.png', 10),
('Signal Disruptor (Mute)', 'Bloqueia drones e dispositivos inimigos', 'https://static9.cdn.ubi.com/resource/en-US/game/rainbow6/siege/R6-operators-gadget-mute_229896.png', 10),
('Shock Wire (Bandit)', 'Eletrifica paredes e destrói gadgets', 'https://banditodorito.home.blog/wp-content/uploads/2018/10/shock-wire1.png', 10),
('Welcome Mat (Frost)', 'Armadilha que derruba inimigos distraídos', 'https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/3xlKismScJsEbZgXdMgu5v/261f291604550bc4039b7dde00ba551e/R6-operators-gadget-frost.webp', 10),
('Evil Eye (Maestro)', 'Câmeras blindadas que dão choque', 'https://i.etsystatic.com/56177334/r/il/5f1659/7798852531/il_570xN.7798852531_z9zw.jpg', 10);


CREATE database R6;
USE R6;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    email VARCHAR(95) UNIQUE NOT NULL,
    senha VARCHAR(45) NOT NULL
);

CREATE TABLE tentativa (
    id_tentativa INT AUTO_INCREMENT PRIMARY KEY,
    data_tentativa DATE NOT NULL,
    fk_id_usuario INT UNIQUE NOT NULL,
    fk_id_resultado INT UNIQUE,
    CONSTRAINT fk_usuario_tentativa 
        FOREIGN KEY (fk_id_usuario) 
        REFERENCES usuario(id_usuario),
	CONSTRAINT fk_tentativa_resultado
		FOREIGN KEY (fk_id_resultado)
        REFERENCES resultado(id_resultado)
);

CREATE TABLE pergunta (
    id_pergunta INT AUTO_INCREMENT PRIMARY KEY,
    texto VARCHAR(45) NOT NULL
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
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

CREATE TABLE chat (
	id_chat INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(150),
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE resultado (
    id_resultado INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL,
    img VARCHAR(255) NOT NULL
);

INSERT INTO resultado (nome, descricao, img) VALUES

(
    'SUP 1',
    'Você é o suporte principal do time. Seu foco está em ajudar execuções, abrir espaço com utilidade e garantir que o time consiga executar estratégias com segurança.',
    '../assets/imgs/resultados/sup1.jpg'
),

(
    'SUP 2',
    'Você joga focado em informação e cobertura. Seu estilo prioriza drones, câmeras, flank watch e suporte estratégico para manter o controle do mapa.',
    '../assets/imgs/resultados/sup2.jpg'
),

(
    'IGL',
    'Você tem perfil de líder. Costuma coordenar estratégias, adaptar táticas durante a partida e organizar o ritmo do time em situações difíceis.',
    '../assets/imgs/resultados/igl.jpg'
),

(
    'FLEX',
    'Você é adaptável e consegue assumir diferentes funções dependendo da necessidade do time. Seu estilo é equilibrado e versátil.',
    '../assets/imgs/resultados/flex.jpg'
),

(
    'ENTRY',
    'Você gosta de agressividade e impacto imediato. Seu foco está em abrir espaço, buscar eliminações rápidas e pressionar o adversário.',
    '../assets/imgs/resultados/entry.jpg'
);

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
('R4-C', 'Alta agressividade e entrada rápida', 5, 'https://liquipedia.net/commons/images/3/35/R6S_wpn_R4-C.png', 4),
('MK14 EBR', 'Controle e leitura de jogo', 3, 'https://liquipedia.net/commons/images/2/26/R6S_wpn_Mk_14_EBR.png', 4),
('C8-SFW', 'Versátil para várias situações', 4, 'https://liquipedia.net/commons/images/d/d3/R6S_wpn_C8-SFW.png', 4),
('L85A2', 'Consistente e segura', 1, 'https://liquipedia.net/commons/images/7/78/R6S_wpn_L85A2.png', 4),
('MP7 do Zero', 'Precisão e suporte informativo', 2, 'https://liquipedia.net/commons/images/8/80/R6S_wpn_MP7.png', 4),

-- PERGUNTA 5
('ALDA 5.56', 'Controle de informação e ângulos', 2, 'https://liquipedia.net/commons/images/7/7b/R6S_wpn_ALDA_5.56.png', 5),
('Vector', 'Trocação rápida e agressiva', 5, 'https://liquipedia.net/commons/images/a/a1/R6S_wpn_Vector_.45_ACP.png', 5),
('MP5', 'Estabilidade para coordenar o time', 3, 'https://liquipedia.net/commons/images/8/89/R6S_wpn_MP5.png', 5),
('T-5 SMG', 'Equilibrada em qualquer situação', 4, 'https://liquipedia.net/commons/images/5/50/R6S_wpn_T-5_SMG.png', 5),
('FMG-9', 'Controle defensivo seguro', 1, 'https://liquipedia.net/commons/images/2/26/R6S_wpn_FMG-9.png', 5),

-- PERGUNTA 6
('Ganhar trocação e abrir espaço', 'Pressão ofensiva', 5, 'https://cdn-icons-png.flaticon.com/512/1022/1022348.png', 6),
('Passar informação constantemente', 'Câmeras, drones e calls', 2, 'https://cdn-icons-png.flaticon.com/512/46/46075.png', 6),
('Se adaptar ao que o time precisa', 'Flexibilidade total', 4, 'https://cdn-icons-png.flaticon.com/512/38/38043.png', 6),
('Liderar estratégias e adaptações', 'Controla o ritmo da partida', 3, 'https://cdn-icons-png.flaticon.com/512/1278/1278206.png', 6),
('Dar suporte utilitário ao time', 'Ajuda execuções e cobertura', 1, 'https://cdn-icons-png.flaticon.com/512/4233/4233839.png', 6),

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