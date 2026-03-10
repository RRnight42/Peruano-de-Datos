--Creacion tabla artifacts
--
CREATE TABLE artifacts (
    artifact_id INTEGER NOT NULL
                        PRIMARY KEY AUTOINCREMENT,
    set_name    TEXT    UNIQUE
                        NOT NULL,
    rarity      TEXT    NOT NULL,
    bonus1      TEXT    NOT NULL,
    bonus2      TEXT
);

--Creacion tabla characters
--
CREATE TABLE characters (
    character_id     INTEGER      NOT NULL
                                  PRIMARY KEY AUTOINCREMENT,
    character_name   TEXT         NOT NULL
                                  UNIQUE,
    star_rarity      INTEGER (1)  NOT NULL,
    region           INTEGER (15) REFERENCES regions (region_id),
    vision           TEXT         REFERENCES elements (element_name),
    arkhe            TEXT,
    main_artifact    TEXT         REFERENCES artifacts (set_name),
    weapon_type      TEXT         NOT NULL
                                  REFERENCES weapons (type),
    release_date     TEXT         NOT NULL,
    model            TEXT         NOT NULL,
    constellation_id INTEGER      NOT NULL
                                  REFERENCES constellation (constellation_id),
    birthday         TEXT         NOT NULL
);

--Creacion tabla constellation
--
CREATE TABLE constellation (
    constellation_id   INTEGER NOT NULL
                               PRIMARY KEY AUTOINCREMENT,
    constellation_name TEXT    NOT NULL
);

--Creacion tabla elements
--
CREATE TABLE elements (
    element_id   INTEGER   NOT NULL
                           PRIMARY KEY AUTOINCREMENT,
    element_name TEXT (15) NOT NULL
                           UNIQUE
);

--Creacion tabla mission
--
CREATE TABLE mission (
    mission_id   INTEGER NOT NULL
                         PRIMARY KEY AUTOINCREMENT,
    mission_name TEXT    NOT NULL,
    type         TEXT    NOT NULL,
    reward       TEXT,
    completed    TEXT,
    region_name  TEXT    REFERENCES regions (region_name) 
);

--Creacion tabla players
--
CREATE TABLE players (
    player_id      INTEGER NOT NULL
                           PRIMARY KEY AUTOINCREMENT,
    nickname       TEXT    NOT NULL,
    character_name TEXT    REFERENCES characters (character_name),
    gender         TEXT,
    registry_date  TEXT    NOT NULL
);

--Creacion tabla regions
--
CREATE TABLE regions (
    region_id   INTEGER NOT NULL
                        PRIMARY KEY AUTOINCREMENT,
    region_name TEXT    NOT NULL
                        UNIQUE
);

--Creacion tabla weapons
--
CREATE TABLE weapons (
    weapon_id       INTEGER NOT NULL
                            PRIMARY KEY AUTOINCREMENT,
    weapon_name     TEXT    UNIQUE
                            NOT NULL,
    type            TEXT    NOT NULL,
    rarity          TEXT    NOT NULL,
    base_atk        INTEGER NOT NULL,
    max_atk         INTEGER NOT NULL,
    substat_type    TEXT,
    base_substat    TEXT,
    passive_name    TEXT,
    passive_ability TEXT,
    release_date    TEXT    NOT NULL
);

--Inserts de players
--
INSERT INTO players (apodo, fecha_registro, nombre_personaje, genero) VALUES
('ShadowFox01','2021-02-14',NULL,'Hombre'),
('LunaPixel','2022-07-03',NULL,'Mujer'),
('NeoRider','2023-11-22',NULL,'Hombre'),
('CrystalByte','2024-01-10',NULL,'Mujer'),
('OmegaStorm','2020-10-05',NULL,'Hombre'),
('SilentNova','2025-06-18',NULL,'Personalizado'),
('IronPhantom','2021-08-29',NULL,'Hombre'),
('VelvetArrow','2022-03-12',NULL,'Mujer'),
('CyberWolf','2023-04-27',NULL,'Hombre'),
('MysticRain','2024-09-01',NULL,'Mujer'),
('TurboShade','2025-01-15',NULL,'Hombre'),
('EchoFlare','2021-12-30',NULL,'Personalizado'),
('QuantumLily','2022-05-21',NULL,'Mujer'),
('BlazeRunner','2023-07-09',NULL,'Hombre'),
('FrostNova','2024-11-19',NULL,'Mujer'),
('DarkComet','2020-12-01',NULL,'Hombre'),
('PixelKnight','2021-04-16',NULL,'Hombre'),
('AuroraByte','2022-09-08',NULL,'Mujer'),
('GhostVector','2023-02-25',NULL,'Personalizado'),
('SilverVortex','2024-06-13',NULL,'Hombre'),
('NeonPetal','2025-02-28',NULL,'Mujer'),
('CrimsonLoop','2021-06-07',NULL,'Hombre'),
('BlueNebula','2022-11-30',NULL,'Mujer'),
('RogueMatrix','2023-09-14',NULL,'Hombre'),
('ZenithBloom','2024-03-05',NULL,'Mujer'),
('HyperFalcon','2025-07-22',NULL,'Hombre'),
('IvoryPulse','2021-09-19',NULL,'Personalizado'),
('NightCipher','2022-01-11',NULL,'Hombre'),
('SolarWhisper','2023-05-02',NULL,'Mujer'),
('RapidSpecter','2024-08-26',NULL,'Hombre'),
('LilacStorm','2025-03-03',NULL,'Mujer'),
('TitanEcho','2020-11-17',NULL,'Hombre'),
('NovaSkater','2021-03-08',NULL,'Personalizado'),
('AmberFlux','2022-06-24',NULL,'Mujer'),
('PhantomDash','2023-10-31',NULL,'Hombre'),
('MintGlider','2024-02-14',NULL,'Mujer'),
('CobaltStrike','2025-05-09',NULL,'Hombre'),
('DreamCircuit','2021-11-05',NULL,'Personalizado'),
('RubyVelocity','2022-04-18',NULL,'Mujer'),
('SteelHawk','2023-01-07',NULL,'Hombre'),
('PastelOrbit','2024-07-29',NULL,'Mujer'),
('NightBloom','2025-08-12',NULL,'Mujer'),
('VectorLion','2021-05-27',NULL,'Hombre'),
('CosmicDaisy','2022-12-06',NULL,'Mujer'),
('TurboPetal','2023-06-16',NULL,'Personalizado'),
('IronLotus','2024-10-08',NULL,'Mujer'),
('GhostDrifter','2025-04-01',NULL,'Hombre'),
('AzureFlash','2021-01-23',NULL,'Hombre'),
('VioletComet','2022-08-14',NULL,'Mujer'),
('CyberPetra','2023-03-19',NULL,'Personalizado'),
('RapidNova','2024-05-25',NULL,'Hombre'),
('MoonCipher','2025-09-30',NULL,'Mujer'),
('BlitzFeather','2021-07-11',NULL,'Hombre');

--Inserts de artifacts
--
INSERT INTO artifacts (set_name,rarity,bonus2,bonus4) VALUES
('Adventurer','1-3★','Max HP +1000','Opening chests regenerates 30% Max HP over 5s'),
('Lucky Dog','1-3★','DEF +100','Picking up Mora restores 300 HP'),
('Traveling Doctor','1-3★','Incoming Healing Bonus +20%','Using Elemental Burst restores 20% HP'),
('Resolution of Sojourner','3-4★','ATK +18%','Charged Attack CRIT Rate +30%'),
('Tiny Miracle','3-4★','All Elemental RES +20%','Taking Elemental DMG increases that Elemental RES by 30% for 10s'),
('Berserker','3-4★','CRIT Rate +12%','When HP <70%, CRIT Rate +24%'),
('Instructor','3-4★','Elemental Mastery +80','Triggering Elemental Reaction increases party EM by 120 for 8s'),
('The Exile','3-4★','Energy Recharge +20%','Using Burst regenerates 2 Energy for party every 2s for 6s'),
('Martial Artist','3-4★','Normal/Charged ATK DMG +15%','After using Skill, NA/CA DMG +25% for 8s'),
('Scholar','3-4★','Energy Recharge +20%','Gaining particles gives 3 Energy to bow/catalyst allies'),
('Defender''s Will','3-4★','DEF +30%','For each different element in party, Elemental RES +30%'),
('Gambler','3-4★','Elemental Skill DMG +20%','Defeating enemy resets Skill CD (15s CD)'),
('Brave Heart','3-4★','ATK +18%','DMG +30% against enemies with >50% HP'),
('Prayers for Wisdom','3-4★','Electro affected duration -40%','—'),
('Prayers for Illumination','3-4★','Pyro affected duration -40%','—'),
('Prayers for Destiny','3-4★','Hydro affected duration -40%','—'),
('Prayers to Springtime','3-4★','Cryo affected duration -40%','—');

INSERT INTO Artifacts (set_name,rarity,bonus2,bonus4) VALUES
('Gladiator''s Finale','4-5★','ATK +18%','Sword/Claymore/Polearm Normal ATK DMG +35%'),
('Wanderer''s Troupe','4-5★','Elemental Mastery +80','Catalyst/Bow Charged ATK DMG +35%'),
('Noblesse Oblige','4-5★','Elemental Burst DMG +20%','Using Burst increases party ATK +20% for 12s'),
('Bloodstained Chivalry','4-5★','Physical DMG Bonus +25%','After defeating enemy, Charged ATKs cost no Stamina & DMG +50% for 10s'),
('Maiden Beloved','4-5★','Healing Bonus +15%','Using Skill/Burst increases healing received by all party by 20% for 10s'),
('Viridescent Venerer','4-5★','Anemo DMG Bonus +15%','Swirl DMG +60%, reduces swirled Element RES by 40%'),
('Archaic Petra','4-5★','Geo DMG Bonus +15%','Crystallize grants 35% Elemental DMG Bonus to that element'),
('Retracing Bolide','4-5★','Shield Strength +35%','While shielded, NA/CA DMG +40%'),
('Crimson Witch of Flames','4-5★','Pyro DMG Bonus +15%','Reaction DMG increased; Skill increases 2p bonus'),
('Thundering Fury','4-5★','Electro DMG Bonus +15%','Reaction DMG increased & Skill CD decreased'),
('Lavawalker','4-5★','Pyro RES +40%','DMG against Pyro-affected enemies +35%'),
('Thundersoother','4-5★','Electro RES +40%','DMG against Electro-affected enemies +35%'),
('Blizzard Strayer','4-5★','Cryo DMG Bonus +15%','CRIT Rate +20% vs Cryo; +20% more if Frozen'),
('Heart of Depth','4-5★','Hydro DMG Bonus +15%','After Skill, NA/CA DMG +30% for 15s'),
('Tenacity of the Millelith','4-5★','HP +20%','Skill hits increase party ATK +20% & Shield Strength +30%'),
('Pale Flame','4-5★','Physical DMG Bonus +25%','Skill hit increases ATK; 2 stacks doubles 2p effect'),
('Shimenawa''s Reminiscence','4-5★','ATK +18%','After Skill, lose 15 Energy → NA/CA/Plunge DMG +50%'),
('Emblem of Severed Fate','4-5★','Energy Recharge +20%','Burst DMG increased by 25% of ER (max 75%)'),
('Husk of Opulent Dreams','4-5★','DEF +30%','Gain DEF & Geo DMG stacks over time'),
('Ocean-Hued Clam','4-5★','Healing Bonus +15%','Healing accumulates & deals AoE DMG'),
('Vermillion Hereafter','4-5★','ATK +18%','After Burst, ATK increases when HP decreases'),
('Echoes of an Offering','4-5★','ATK +18%','Normal ATK hits may trigger bonus DMG'),
('Deepwood Memories','4-5★','Dendro DMG Bonus +15%','Skill/Burst hits reduce Dendro RES by 30%'),
('Gilded Dreams','4-5★','Elemental Mastery +80','After reaction gain ATK or EM depending on party'),
('Flower of Paradise Lost','4-5★','Elemental Mastery +80','Bloom/Hyperbloom/Burgeon DMG +40% (+25% stacks)'),
('Desert Pavilion Chronicle','4-5★','Anemo DMG Bonus +15%','Charged ATK hit increases NA/CA/Plunge DMG & SPD'),
('Nymph''s Dream','4-5★','Hydro DMG Bonus +15%','Stacks increase ATK & Hydro DMG'),
('Vourukasha''s Glow','4-5★','HP +20%','Skill/Burst DMG increases & increases further when hit'),
('Golden Troupe','4-5★','Elemental Skill DMG +20%','Skill DMG +25% more off-field'),
('Marechaussee Hunter','4-5★','Normal/Charged ATK DMG +15%','HP changes increase CRIT Rate'),
('Song of Days Past','4-5★','Healing Bonus +15%','Healing accumulates & boosts next DMG'),
('Nighttime Whispers in the Echoing Woods','4-5★','Geo DMG Bonus +15%','After shield gain ATK & Geo DMG'),
('Fragment of Harmonic Whimsy','4-5★','ATK +18%','Bond of Life increases DMG'),
('Unfinished Reverie','4-5★','ATK +18%','After leaving combat DMG increases'),
('Obsidian Codex','4-5★','CRIT Rate +12%','Nightsoul state increases DMG'),
('Scroll of the Hero of Cinder City','4-5★','Elemental Mastery +80','Nightsoul Burst increases reaction DMG');

--El resto de inserciones de datos fueron realizadas de forma manual, salvo la tabla constellation que se generó duplicando la tabla characters, eliminando las columnas sobrantes y duplicados.

--Consultas
--

--Consulta de personajes lanzados durante 2020: 
SELECT *
FROM characters
WHERE release_date >= '2020-01-01'
AND release_date < '2021-01-01';

--Consulta de cuantos personajes hay con cada visión: 
SELECT vision, COUNT(*) AS total
FROM characters
GROUP BY vision;

--Consulta sobre cuantos personajes son de la región Mondstadt:
SELECT characters.character_name , regions.region_name
FROM characters
JOIN regions
ON characters.region = regions.region_id
WHERE regions.region_id = 1;

--Consulta de cuantos jugadores “Hombres” poseen un personaje masculino:
SELECT players.*, characters.character_name, characters.model
FROM players
JOIN characters
ON players.character_id - characters. character_id
WHERE players.gender = 'Hombre'
AND characters.model LIKE '% Male%';

--Consulta de ordenación de personajes por el tipo de arma que poseen:
SELECT DISTINCT weapons.type, characters.character_name
FROM weapons
JOIN characters ON characters.weapon_type = weapons.type
ORDER BY weapons. type ASC;

--Contar los artefactos y su rareza:
SELECT rarity, COUNT (artifacts.rarity)AS num_artifacts
FROM artifacts
GROUP BY artifacts.rarity
ORDER BY artifacts.rarity ASC;

--Nombre de los personajes, su arma principal, su visión, sus artefactos principales y los bonus de estos:
SELECT characters.character_name, characters.weapon_type, characters.vision, characters.main_artifact, artifacts.bonus1, artifacts.bonus2
FROM characters
JOIN artifacts
ON characters.main_artifact = artifacts.set_name
ORDER BY character_id;

--Número de personajes de cada tipo de modelo ordenados de mayor a menor:
SELECT characters.model, COUNT(*) AS Numero_Modelos
FROM characters
GROUP BY model
ORDER BY Numero_Modelos DESC;
