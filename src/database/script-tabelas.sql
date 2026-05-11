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
('Qual mapa você jogaria?'),
('Qual arma você usaria no ataque?'),
('Qual arma você usaria na defesa?'),
('Qual função você jogaria no time?'),
('Qual utilitário você usaria no ataque?'),
('Qual utilitário você usaria na defesa?'),
('Qual gadget você usaria no ataque?'),
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