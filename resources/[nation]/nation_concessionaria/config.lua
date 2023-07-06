local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

config = {}
Proxy.addInterface("nation_concessionaria", config)

vGARAGE = Tunnel.getInterface("vrp_garages")

config.imgDir = "http://102.165.46.253/vrp_images/"  -- DIRETORIO DAS IMAGENS DOS VEÍCULOS

-- LISTA DOS VEÍCULOS EM DESTAQUE

config.topVehicles = {}

config.logo = "https://media.discordapp.net/attachments/896503427113299978/896827096800845864/logocautionsemfundo.png?width=676&height=676" -- LOGO DO SERVIDOR

config.defaultImg = "https://svgsilh.com/svg/160895.svg" -- IMAGEM DEFAULT (SERÁ EXIBIDA QUANDO NÃO EXISTIR A IMAGEM DE ALGUM VEÍCULO NO DIRETÓRIO ESPECIFICADO)

config.openconce_permission = nil -- permissao para abrir a concessionaria

config.updateconce_permission = "dono.permissao" -- permissao para abrir o menu de gerenciamento da conce

config.porcentagem_venda = 50 -- porcentagem de venda dos veículos possuidos

config.porcentagem_testdrive = 3 -- porcentagem do valor do veículo paga para a realização do test drive

config.tempo_testdrive = 120 -- tempo de duração do test drive em segundos

config.maxDistance = 500 -- distância máxima (em radius(raio)) que o player poderá ir quando estiver realizando o test drive

config.porcentagem_aluguel = 60 -- porcentagem do valor do veículo paga para alugar

-- CLASSES QUE APARECEM NO MENU DA CONCE

config.conceClasses = {
	{ class = "sedans", img = "https://media.discordapp.net/attachments/813370841588432917/852457786126368768/india-bound-2019-honda-civic-images-front-three-qu-e966.png" },
	{ class = "suvs", img = "https://media.discordapp.net/attachments/813370841588432917/852457814277750784/yeni-range-rover-evoque-landmark-edition-1.png" },
	{ class = "imports", img = "https://media.discordapp.net/attachments/813370841588432917/852457832632287262/thumb2-lamborghini-gallardo-supercars-motion-blur-road-gray-gallardo.png" },
	{ class = "trucks", img = "https://media.discordapp.net/attachments/813370841588432917/852457853058940948/thumb-1920-149257.png" },
	{ class = "motos", img = "https://media.discordapp.net/attachments/813370841588432917/852457905977819136/cc92dda56f23a2a41682e80e7fe0f744.png" },
	{ class = "outros", img = "https://media.discordapp.net/attachments/813370841588432917/852457898097377290/thumb2-ford-transit-custom-sport-4k-2018-cars-motion-blur-orange-ford-transit.png" },
}

-- IMAGEM QUE APARECE NA SEÇÃO DE 'MEUS VEÍCULOS'

config.myVehicles_img = "https://media.discordapp.net/attachments/813370841588432917/852457768694710272/9af4986f985b317b9f7dc40ae3a4a32e.png"

-- CLASSES DOS VEÍCULOS INSERIDAS DENTRO DAS CLASSES QUE APARECEM NA CONCE

config.availableClasses = {
	["sedans"] = {"sedan", "carros"},
	["suvs"] = {"suv"},
	["imports"] = {"classic", "sport", "super"},  
	["trucks"] = {"industrial", "utility", "commercial"},
	["motos"] = {"moto", "cycle"},
	["outros"] = {"compact", "coupé", "muscle", "off-road",  "boat",  "helicopter",  "plane",  "service", "emergency",  "military",  "train", "van"}
}

-- ÍCONES DA CONCE

config.miscIcons = {
	{ description = "Força e velocidade necessárias para aquela dose de adrenalina.", img = "https://www.flaticon.com/svg/static/icons/svg/586/586141.svg" },
	{ description = "Incríveis opções econômicas que cabem no seu bolso!", img = "https://www.flaticon.com/svg/static/icons/svg/846/846117.svg" },
	{ description = "Para você que valoriza a eficácia e praticidade.", img = "https://www.flaticon.com/svg/static/icons/svg/1535/1535519.svg" },
}

-- DESCONTOS POR PERMISSAO

config.descontos = {
	-- { perm = "administrador.permissao", porcentagem = 50 }
}

-- cada veículo deve conter => { hash, name, price, banido, modelo, capacidade, tipo }

config.vehList = {

	-- CAMINHÃO
	{ hash = GetHashKey('burrito3'), name = 'burrito3', price = 400000, banido = false, modelo = 'Burrito3', capacidade = 150 },
	{ hash = GetHashKey('gburrito2'), name = 'gburrito2', price = 430000, banido = false, modelo = 'Gburrito2', capacidade = 160 },
	{ hash = GetHashKey('bobcatxl'), name = 'bobcatxl', price = 200000, banido = false, modelo = 'Bobcatxl', capacidade = 100 },

	-- CARROS COMPACTOS
	{ hash = GetHashKey('asbo'), name = 'asbo', price = 50000, banido = false, modelo = 'Asbo', capacidade = 40 },
	{ hash = GetHashKey('blista'), name = 'blista', price = 30000, banido = false, modelo = 'Blista', capacidade = 40 },
	{ hash = GetHashKey('brioso'), name = 'brioso', price = 35000, banido = false, modelo = 'Blioso', capacidade = 40 },
	{ hash = GetHashKey('club'), name = 'club', price = 25000, banido = false, modelo = 'Club', capacidade = 40 },
	{ hash = GetHashKey('kanjo'), name = 'kanjo', price = 25000, banido = false, modelo = 'Kanjo', capacidade = 40 },
	{ hash = GetHashKey('issi2'), name = 'issi2', price = 25000, banido = false, modelo = 'Issi2', capacidade = 20 },
	{ hash = GetHashKey('panto'), name = 'panto', price = 12000, banido = false, modelo = 'Panto', capacidade = 20 },
	{ hash = GetHashKey('prairie'), name = 'prairie', price = 25000, banido = false, modelo = 'Prairie', capacidade = 35 },
	{ hash = GetHashKey('rhapsody'), name = 'rhapsody', price = 25000, banido = false, modelo = 'Rhapsody', capacidade = 30 },
	{ hash = GetHashKey('weevil'), name = 'weevil', price = 1000000, banido = false, modelo = 'Weevil', capacidade = 30 },
	{ hash = GetHashKey('cogcabrio'), name = 'cogcabrio', price = 100000, banido = false, modelo = 'Cogcabrio', capacidade = 60 },


	-- CARROS COUPES
	{ hash = GetHashKey('exemplar'), name = 'exemplar', price = 100000, banido = false, modelo = 'Exemplar', capacidade = 30 },
	{ hash = GetHashKey('f620'), name = 'f620', price = 85000, banido = false, modelo = 'F620', capacidade = 30 },
	{ hash = GetHashKey('jackal'), name = 'jackal', price = 90000, banido = false, modelo = 'Jackal', capacidade = 50 },
	{ hash = GetHashKey('oracle2'), name = 'oracle2', price = 140000, banido = false, modelo = 'Oracle2', capacidade = 60 },
	{ hash = GetHashKey('sentinel2'), name = 'sentinel2', price = 160000, banido = false, modelo = 'Sentinel2', capacidade = 40 },
	{ hash = GetHashKey('windsor2'), name = 'windsor2', price = 200000, banido = false, modelo = 'Windsor2', capacidade = 40 },
	{ hash = GetHashKey('guardian'), name = 'guardian', price = 300000, banido = false, modelo = 'Guardian', capacidade = 150 },

	-- MOTOS
	{ hash = GetHashKey('faggio'), name = 'faggio', price = 8000, banido = false, modelo = 'Faggio', capacidade = 30 },
	{ hash = GetHashKey('faggio3'), name = 'faggio3', price = 15000, banido = false, modelo = 'Faggio3', capacidade = 30 },
	{ hash = GetHashKey('akuma'), name = 'akuma', price = 400000, banido = false, modelo = 'Akuma', capacidade = 15 },
	{ hash = GetHashKey('bati'), name = 'bati', price = 400000, banido = false, modelo = 'Bati', capacidade = 15 },
	{ hash = GetHashKey('bati2'), name = 'bati2', price = 400000, banido = false, modelo = 'Bati2', capacidade = 15 },
	{ hash = GetHashKey('bf400'), name = 'bf400', price = 175000, banido = false, modelo = 'BF400', capacidade = 20 },
	{ hash = GetHashKey('carbonrs'), name = 'carbonrs', price = 350000, banido = false, modelo = 'Carbonrs', capacidade = 15 },
	{ hash = GetHashKey('cliffhanger'), name = 'cliffhanger', price = 200000, banido = false, modelo = 'Cliffhanger', capacidade = 15 },
	{ hash = GetHashKey('diablous'), name = 'diablous', price = 150000, banido = false, modelo = 'Diablous', capacidade = 15 },
	{ hash = GetHashKey('diablous2'), name = 'diablous2', price = 215000, banido = false, modelo = 'Diablous2', capacidade = 15 },
	{ hash = GetHashKey('double'), name = 'double', price = 145000, banido = false, modelo = 'Double', capacidade = 15 },
	{ hash = GetHashKey('enduro'), name = 'enduro', price = 200000, banido = false, modelo = 'Enduro', capacidade = 15 },
	{ hash = GetHashKey('esskey'), name = 'esskey', price = 175000, banido = false, modelo = 'Esskey', capacidade = 15 },
	{ hash = GetHashKey('hakuchou'), name = 'hakuchou', price = 210000, banido = false, modelo = 'Hakuchou', capacidade = 15 },
	{ hash = GetHashKey('hakuchou2'), name = 'hakuchou2', price = 250000, banido = false, modelo = 'Hakuchou2', capacidade = 15 },
	{ hash = GetHashKey('lectro'), name = 'lectro', price = 175000, banido = false, modelo = 'Lectro', capacidade = 15 },
	{ hash = GetHashKey('pcj'), name = 'pcj', price = 20000, banido = false, modelo = 'Pcj', capacidade = 15 },
	{ hash = GetHashKey('sanchez'), name = 'sanchez', price = 120000, banido = false, modelo = 'Sanchez', capacidade = 15 },
	{ hash = GetHashKey('sanchez2'), name = 'sanchez2', price = 140000, banido = false, modelo = 'Sanchez2', capacidade = 15 },
	{ hash = GetHashKey('shotaro'), name = 'shotaro', price = 450000, banido = false, modelo = 'Shotaro', capacidade = 15 },
	{ hash = GetHashKey('vader'), name = 'vader', price = 70000, banido = false, modelo = 'Vader', capacidade = 15 },
	{ hash = GetHashKey('vortex'), name = 'vortex', price = 175000, banido = false, modelo = 'Vortex', capacidade = 15 },
	{ hash = GetHashKey('manchez2'), name = 'manchez2', price = 175000, banido = false, modelo = 'Manchez2', capacidade = 15 },
	
	-- CARROS MUSCLE
	{ hash = GetHashKey('blade'), name = 'blade', price = 185000, banido = false, modelo = 'Blade', capacidade = 40 },
	{ hash = GetHashKey('buccaneer2'), name = 'buccaneer2', price = 110000, banido = false, modelo = 'Buccaneer2', capacidade = 40 },
	{ hash = GetHashKey('dominator'), name = 'dominator', price = 110000, banido = false, modelo = 'Dominator', capacidade = 30 },
	{ hash = GetHashKey('dominator3'), name = 'dominator2', price = 110000, banido = false, modelo = 'Dominator3', capacidade = 35 },
	{ hash = GetHashKey('dominator3'), name = 'dominator3', price = 110000, banido = false, modelo = 'Dominator3', capacidade = 35 },
	{ hash = GetHashKey('faction3'), name = 'faction3', price = 120000, banido = false, modelo = 'Faction3', capacidade = 50 },
	{ hash = GetHashKey('ellie'), name = 'ellie', price = 120000, banido = false, modelo = 'Ellie', capacidade = 40 },
	{ hash = GetHashKey('gauntlet'), name = 'gauntlet', price = 150000, banido = false, modelo = 'Gauntlet', capacidade = 40 },
	{ hash = GetHashKey('gauntlet4'), name = 'gauntlet4', price = 160000, banido = false, modelo = 'Gauntlet4', capacidade = 40 },
	{ hash = GetHashKey('hustler'), name = 'hustler', price = 120000, banido = false, modelo = 'Hustler', capacidade = 35 },
	{ hash = GetHashKey('moonbeam2'), name = 'moonbeam2', price = 150000, banido = false, modelo = 'Moonbeam2', capacidade = 70 },
	{ hash = GetHashKey('ratloader2'), name = 'ratloader2', price = 140000, banido = false, modelo = 'Ratloader2', capacidade = 55 },
	{ hash = GetHashKey('sabregt2'), name = 'sabregt2', price = 135000, banido = false, modelo = 'Sabregt2', capacidade = 40 },
	{ hash = GetHashKey('slamvan'), name = 'slamvan', price = 155000, banido = false, modelo = 'Slamvan', capacidade = 50 },
	{ hash = GetHashKey('slamvan3'), name = 'slamvan3', price = 170000, banido = false, modelo = 'Slamvan3', capacidade = 55 },
	{ hash = GetHashKey('virgo3'), name = 'virgo3', price = 140000, banido = false, modelo = 'Virgo3', capacidade = 40 },
	{ hash = GetHashKey('voodoo'), name = 'voodoo', price = 140000, banido = false, modelo = 'Voodoo', capacidade = 55 },

	-- CARROS OFF-ROAD
	{ hash = GetHashKey('bifta'), name = 'bifta', price = 130000, banido = false, modelo = 'Bifta', capacidade = 20 },
	{ hash = GetHashKey('blazer'), name = 'blazer', price = 100000, banido = false, modelo = 'Blazer', capacidade = 20 },
	{ hash = GetHashKey('everon'), name = 'everon', price = 1700000, banido = false, modelo = 'Everon', capacidade = 90 },
	{ hash = GetHashKey('kamacho'), name = 'kamacho', price = 900000, banido = false, modelo = 'Kamacho', capacidade = 80 },
	{ hash = GetHashKey('riata'), name = 'riata', price = 300000, banido = false, modelo = 'Riata', capacidade = 60 },
	{ hash = GetHashKey('sandking2'), name = 'sandking2', price = 500000, banido = false, modelo = 'Sandking2', capacidade = 120 },
	{ hash = GetHashKey('baller'), name = 'baller', price = 100000, banido = false, modelo = 'Baller', capacidade = 40 },
	{ hash = GetHashKey('baller2'), name = 'baller2', price = 125000, banido = false, modelo = 'Baller2', capacidade = 45 },
	{ hash = GetHashKey('baller3'), name = 'baller3', price = 150000, banido = false, modelo = 'Baller3', capacidade = 45 },
	{ hash = GetHashKey('baller4'), name = 'baller4', price = 165000, banido = false, modelo = 'Baller4', capacidade = 50 },
	{ hash = GetHashKey('baller5'), name = 'baller5', price = 800000, banido = false, modelo = 'Baller5', capacidade = 55 },
	{ hash = GetHashKey('baller6'), name = 'baller6', price = 900000, banido = false, modelo = 'Baller6', capacidade = 55 },
	{ hash = GetHashKey('contender'), name = 'contender', price = 700000, banido = false, modelo = 'Contender', capacidade = 80 },
	{ hash = GetHashKey('dubsta'), name = 'dubsta', price = 500000, banido = false, modelo = 'Dubsta', capacidade = 60 },
	{ hash = GetHashKey('dubsta2'), name = 'dubsta2', price = 550000, banido = false, modelo = 'Dubsta2', capacidade = 65 },
	{ hash = GetHashKey('dubsta3'), name = 'dubsta3', price = 1500000, banido = false, modelo = 'Dubsta3', capacidade = 70 },
	{ hash = GetHashKey('mesa'), name = 'mesa', price = 300000, banido = false, modelo = 'Mesa', capacidade = 50 },
	{ hash = GetHashKey('mesa3'), name = 'mesa3', price = 750000, banido = false, modelo = 'Mesa3', capacidade = 80 },
	{ hash = GetHashKey('patriot'), name = 'patriot', price = 400000, banido = false, modelo = 'Patriot', capacidade = 50 },
	{ hash = GetHashKey('patriot2'), name = 'patriot2', price = 500000, banido = false, modelo = 'Patriot2', capacidade = 40 },
	{ hash = GetHashKey('toros'), name = 'toros', price = 400000, banido = false, modelo = 'Patriot', capacidade = 50 },
	{ hash = GetHashKey('xls2'), name = 'xls2', price = 800000, banido = false, modelo = 'Xls2', capacidade = 50 },
	{ hash = GetHashKey('sadler'), name = 'sadler', price = 130000, banido = false, modelo = 'Sadler', capacidade = 60 },
	{ hash = GetHashKey('bison'), name = 'bison', price = 140000, banido = false, modelo = 'Bison', capacidade = 65 },
	{ hash = GetHashKey('rumpo3'), name = 'rumpo3', price = 450000, banido = false, modelo = 'rumpo3', capacidade = 60 },

	-- CARROS SEDANS
	{ hash = GetHashKey('asea'), name = 'asea', price = 20000, banido = false, modelo = 'Asea', capacidade = 30 },
	{ hash = GetHashKey('cog55'), name = 'cog55', price = 200000, banido = false, modelo = 'Cog55', capacidade = 50 },
	{ hash = GetHashKey('cog552'), name = 'cog552', price = 750000, banido = false, modelo = 'Cog552', capacidade = 40 },
	{ hash = GetHashKey('cognoscenti'), name = 'cognoscenti', price = 200000, banido = false, modelo = 'Cognoscenti', capacidade = 50 },
	{ hash = GetHashKey('stafford'), name = 'stafford', price = 150000, banido = false, modelo = 'Stafford', capacidade = 30 },
	{ hash = GetHashKey('stretch'), name = 'stretch', price = 300000, banido = false, modelo = 'Stretch', capacidade = 30 },
	{ hash = GetHashKey('superd'), name = 'superd', price = 150000, banido = false, modelo = 'Superd', capacidade = 30 },
	{ hash = GetHashKey('rallytruck'), name = 'rallytruck', price = 1800000, banido = false, modelo = 'Rally Truck', capacidade = 400 },

	-- CARROS SPORTS
	{ hash = GetHashKey('buffalo'), name = 'buffalo', price = 150000, banido = false, modelo = 'Buffalo', capacidade = 30 },
	{ hash = GetHashKey('buffalo2'), name = 'buffalo2', price = 150000, banido = false, modelo = 'Buffalo2', capacidade = 30 },
	{ hash = GetHashKey('buffalo3'), name = 'buffalo3', price = 150000, banido = false, modelo = 'Buffalo3', capacidade = 30 },
	{ hash = GetHashKey('carbonizzare'), name = 'carbonizzare', price = 235000, banido = false, modelo = 'Carbonizzare', capacidade = 30 },
	{ hash = GetHashKey('comet2'), name = 'comet2', price = 200000, banido = false, modelo = 'Comet2', capacidade = 30 },
	{ hash = GetHashKey('comet3'), name = 'comet3', price = 235000, banido = false, modelo = 'Comet3', capacidade = 35 },
	{ hash = GetHashKey('comet5'), name = 'comet5', price = 300000, banido = false, modelo = 'Comet5', capacidade = 30 },
	{ hash = GetHashKey('coquette4'), name = 'coquette4', price = 2500000, banido = false, modelo = 'Coquette4', capacidade = 30 },
	{ hash = GetHashKey('elegy'), name = 'elegy', price = 170000, banido = false, modelo = 'Elegy2', capacidade = 30 },
	{ hash = GetHashKey('elegy2'), name = 'elegy2', price = 210000, banido = false, modelo = 'Elegy2', capacidade = 30 },
	{ hash = GetHashKey('feltzer2'), name = 'feltzer2', price = 215000, banido = false, modelo = 'Feltzer2', capacidade = 30 },
	{ hash = GetHashKey('flashgt'), name = 'flashgt', price = 215000, banido = false, modelo = 'Flashgt', capacidade = 30 },
	{ hash = GetHashKey('futo'), name = 'futo', price = 110000, banido = false, modelo = 'Futo', capacidade = 30 },
	{ hash = GetHashKey('gb200'), name = 'gb200', price = 110000, banido = false, modelo = 'Gb200', capacidade = 20 },
	{ hash = GetHashKey('komoda'), name = 'komoda', price = 135000, banido = false, modelo = 'Komoda', capacidade = 30 },
	{ hash = GetHashKey('issi7'), name = 'issi7', price = 200000, banido = false, modelo = 'Issi7', capacidade = 30 },
	{ hash = GetHashKey('italigto'), name = 'italigto', price = 200000, banido = false, modelo = 'ItaliGTO', capacidade = 30 },
	{ hash = GetHashKey('jugular'), name = 'jugular', price = 210000, banido = false, modelo = 'Jugular', capacidade = 30 },
	{ hash = GetHashKey('jester'), name = 'jester', price = 200000, banido = false, modelo = 'Jester', capacidade = 30 },
	{ hash = GetHashKey('khamelion'), name = 'khamelion', price = 350000, banido = false, modelo = 'Khamelion', capacidade = 45 },
	{ hash = GetHashKey('kuruma'), name = 'kuruma', price = 150000, banido = false, modelo = 'Kuruma', capacidade = 30 },
	{ hash = GetHashKey('neo'), name = 'neo', price = 300000, banido = false, modelo = 'Neo', capacidade = 30 },
	{ hash = GetHashKey('neon'), name = 'neon', price = 280000, banido = false, modelo = 'Neon', capacidade = 30 },
	{ hash = GetHashKey('ninef2'), name = 'ninef2', price = 210000, banido = false, modelo = 'Ninef2', capacidade = 30 },
	{ hash = GetHashKey('omnis'), name = 'omnis', price = 135000, banido = false, modelo = 'Omnis', capacidade = 20 },
	{ hash = GetHashKey('raiden'), name = 'raiden', price = 300000, banido = false, modelo = 'Raiden', capacidade = 45 },
	{ hash = GetHashKey('ruston'), name = 'ruston', price = 150000, banido = false, modelo = 'Ruston', capacidade = 20 },
	{ hash = GetHashKey('sentinel3'), name = 'sentinel3', price = 135000, banido = false, modelo = 'Sentinel3', capacidade = 20 },
	{ hash = GetHashKey('seven70'), name = 'seven70', price = 160000, banido = false, modelo = 'Seven70', capacidade = 30 },
	{ hash = GetHashKey('sugoi'), name = 'sugoi', price = 1500000, banido = false, modelo = 'Sugoi', capacidade = 30 },
	{ hash = GetHashKey('vstr'), name = 'vstr', price = 300000, banido = false, modelo = 'Vstr', capacidade = 30 },
	{ hash = GetHashKey('italirsx'), name = 'italirsx', price = 3000000, banido = false, modelo = 'ItaliRSX', capacidade = 30 }	,

	-- CARROS SPORT CLASIC
	{ hash = GetHashKey('btype2'), name = 'btype2', price = 120000, banido = false, modelo = 'Btype2', capacidade = 20 },
	{ hash = GetHashKey('btype3'), name = 'btype3', price = 170000, banido = false, modelo = 'Btype3', capacidade = 35 },
	{ hash = GetHashKey('dynasty'), name = 'dynasty', price = 80000, banido = false, modelo = 'Dynasty', capacidade = 30 },
	{ hash = GetHashKey('cheburek'), name = 'cheburek', price = 70000, banido = false, modelo = 'Cheburek', capacidade = 30 },
	{ hash = GetHashKey('ztype'), name = 'ztype', price = 150000, banido = false, modelo = 'Ztype', capacidade = 20 },

	-- CARROS SUPER
	{ hash = GetHashKey('adder'), name = 'adder', price = 1100000, banido = false, modelo = 'Adder', capacidade = 30 },
	{ hash = GetHashKey('autarch'), name = 'autarch', price = 1150000, banido = false, modelo = 'Autarch', capacidade = 30 },
	{ hash = GetHashKey('banshee2'), name = 'banshee2', price = 1120000, banido = false, modelo = 'Banshee2', capacidade = 30 },
	{ hash = GetHashKey('cheetah'), name = 'cheetah', price = 1000000, banido = false, modelo = 'Cheetah', capacidade = 30 },
	{ hash = GetHashKey('entityxf'), name = 'entityxf', price = 1300000, banido = false, modelo = 'Entityxf', capacidade = 30 },
	{ hash = GetHashKey('fmj'), name = 'fmj', price = 1200000, banido = false, modelo = 'Fmj', capacidade = 30 },
	{ hash = GetHashKey('furia'), name = 'furia', price = 1300000, banido = false, modelo = 'Furia', capacidade = 30 },
	{ hash = GetHashKey('krieger'), name = 'krieger', price = 1300000, banido = false, modelo = 'krieger', capacidade = 30 },
	{ hash = GetHashKey('italigtb2'), name = 'italigtb2', price = 1100000, banido = false, modelo = 'ItaliGTB2', capacidade = 30 },
	{ hash = GetHashKey('le7b'), name = 'le7b', price = 1000000, banido = false, modelo = 'Le7b', capacidade = 30 },
	{ hash = GetHashKey('nero2'), name = 'nero2', price = 1500000, banido = false, modelo = 'Nero2', capacidade = 30 },
	{ hash = GetHashKey('osiris'), name = 'osiris', price = 1500000, banido = false, modelo = 'Osiris', capacidade = 30 },
	{ hash = GetHashKey('prototipo'), name = 'prototipo', price = 2000000, banido = false, modelo = 'Prototipo', capacidade = 30 },
	{ hash = GetHashKey('reaper'), name = 'reaper', price = 2000000, banido = false, modelo = 'Reaper', capacidade = 30 },
	{ hash = GetHashKey('s80'), name = 's80', price = 1500000, banido = false, modelo = 'S80', capacidade = 30 },
	{ hash = GetHashKey('sheava'), name = 'sheava', price = 2000000, banido = false, modelo = 'Sheava', capacidade = 30 },
	{ hash = GetHashKey('sultanrs'), name = 'sultanrs', price = 2000000, banido = false, modelo = 'Sultanrs', capacidade = 30 },
	{ hash = GetHashKey('t20'), name = 't20', price = 2000000, banido = false, modelo = 'T20', capacidade = 30 },
	{ hash = GetHashKey('tempesta'), name = 'tempesta', price = 1500000, banido = false, modelo = 'Tempesta', capacidade = 30 },
	{ hash = GetHashKey('tezeract'), name = 'tezeract', price = 2000000, banido = false, modelo = 'Tezeract', capacidade = 30 },
	{ hash = GetHashKey('thrax'), name = 'thrax', price = 1500000, banido = false, modelo = 'Thrax', capacidade = 30 },
	{ hash = GetHashKey('turismor'), name = 'turismor', price = 2000000, banido = false, modelo = 'Turismor', capacidade = 30 },
	{ hash = GetHashKey('tyrant'), name = 'tyrant', price = 1350000, banido = false, modelo = 'Tyrant', capacidade = 30 },
	{ hash = GetHashKey('tyrus'), name = 'tyrus', price = 1500000, banido = false, modelo = 'Tyrus', capacidade = 30 },
	{ hash = GetHashKey('zentorno'), name = 'zentorno', price = 2000000, banido = false, modelo = 'Zentorno', capacidade = 30 },
	
	-- MODS	
	--{ hash = GetHashKey('lancerevolutionx'), name = 'lancerevolutionx', price = 6500000, banido = false, modelo = 'Lancer Evolution X', capacidade = 50 },
	--{ hash = GetHashKey('porsche930'), name = 'porsche930', price = 6500000, banido = false, modelo = 'Porsche 930', capacidade = 50 },
	--{ hash = GetHashKey('mustangmach1'), name = 'mustangmach1', price = 6500000, banido = false, modelo = 'Mustang Mach', capacidade = 30 },
	
}


-- RETORNA A LISTA DE VEÍCULOS
config.getVehList = function()
	return config.vehList
end

-- RETORNA AS INFORMAÇÕES CONTIDAS NA LISTA DE UM VEÍCULO ESPECÍFICO
config.getVehicleInfo = function(vehicle)
	for i in ipairs(config.vehList) do
		if vehicle == config.vehList[i].hash or vehicle == config.vehList[i].name then
            return config.vehList[i]
        end
    end
    return false
end

-- RETORNA O MODELO DE UM VEÍCULO ESPECÍFICO (NOME BONITINHO)
config.getVehicleModel = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.modelo or vehicle
	end
	return vehicle
end

-- RETORNA A CAPACIDADE DO PORTA-MALAS DE UM VEÍCULO ESPECÍFICO
config.getVehicleTrunk = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.capacidade or 0
	end
	return 0
end

-- RETORNA O PREÇO DE UM VEÍCULO ESPECÍFICO
config.getVehiclePrice = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.price or 0
	end
	return 0
end

-- RETORNA O TIPO DE UM VEÍCULO ESPECÍFICO
config.getVehicleType = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.tipo or 0
	end
	return "none"
end

-- RETORNA O STATUS DE BANIDO DE UM VEÍCULO ESPECÍFICO
config.isVehicleBanned = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.banido
	end
	return false
end



-- RETORNA AS INFORMAÇÕES DO VEÍCULO REFERENTE À LISTA DE VEÍCULOS (VEHLIST)
config.getVehicleInfo = function(vehicle)
	for i in ipairs(config.vehList) do
		if vehicle == config.vehList[i].hash or vehicle == config.vehList[i].name then
            return config.vehList[i]
        end
    end
    return false
end

-------------------------------


 --- MYSQL---

 vRP._prepare("nation_conce/getConceVehicles","SELECT * FROM nation_concessionaria WHERE estoque > 0")

vRP._prepare("nation_conce/hasVehicle","SELECT vehicle, alugado FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")

vRP._prepare("nation_conce/hasFullVehicle","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle AND alugado = 0")

vRP._prepare("nation_conce/hasRentedVehicle","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle AND alugado = 1")

vRP._prepare("nation_conce/getMyVehicles", "SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND alugado = 0")

vRP._prepare("nation_conce/deleteRentedVehicles", "DELETE FROM vrp_user_vehicles WHERE alugado = 1 AND data_alugado != @data_alugado")

vRP._prepare("nation_conce/updateUserVehicle","UPDATE vrp_user_vehicles SET alugado = 0 WHERE user_id = @user_id AND vehicle = @vehicle")

vRP.prepare("nation_conce/addUserVehicle",[[
	INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,detido,time,engine,body,fuel,ipva) 
	VALUES(@user_id,@vehicle,@detido,@time,@engine,@body,@fuel,@ipva);
]])

vRP.prepare("nation_conce/addUserRentedVehicle",[[
	INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,detido,time,engine,body,fuel,ipva,alugado,data_alugado) 
	VALUES(@user_id,@vehicle,@detido,@time,@engine,@body,@fuel,@ipva,1,@data_alugado);
]])

vRP._prepare("nation_conce/removeUserVehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")

-----------

function getConceList(cb)
	Citizen.CreateThread(function()
		local vehicles = vRP.query("nation_conce/getConceVehicles") or {}
		cb(vehicles)
	end)
end


function getTopList()
	getConceList(function(list)
		local vehicleList = {}
		for k,v in ipairs(list) do
			local vehInfo = config.getVehicleInfo(v.vehicle)
			if vehInfo then
				vehicleList[#vehicleList+1] = { 
					vehicle = v.vehicle, price = vehInfo.price
				}
			end
		end
		if #vehicleList >= 5 then
			table.sort(vehicleList, function(a, b) return a.price > b.price end)
			for i = 1, 5 do
				local veh = vehicleList[i]
				config.topVehicles[i] = veh.vehicle 
			end
		end
	end)
end


-- NOMES DAS CLASSES DOS VEÍCULOS

config.vehicleClasses = {
	[0] = "compact",  
	[1] = "sedan",  
	[2] = "suv",  
	[3] = "coupé",  
	[4] = "muscle",  
	[5] = "classic",  
	[6] = "sport",  
	[7] = "super",  
	[8] = "moto",  
	[9] = "off-road",  
	[10] = "industrial",  
	[11] = "utility",
	[12] = "van",
	[13] = "cycle",  
	[14] = "boat",  
	[15] = "helicopter",  
	[16] = "plane",  
	[17] = "service", 
	[18] = "emergency",  
	[19] = "military",  
	[20] = "commercial",  
	[21] = "train" 
}


-- FUNCÃO DE COMPRA DO VEÍCULO

config.tryBuyVehicle = function(source, user_id, vehicle, color, price, mods)
	if source and user_id and vehicle and color and price and mods then
		local data = vRP.query("nation_conce/hasVehicle", {user_id = user_id, vehicle = vehicle})
		local hasVehicle = #data > 0
		local isRented = data[1] and data[1].alugado > 0

		if hasVehicle and not isRented then
			return false, "veículo já possuído"
		end

		-- local gvlimit = vGARAGE.getHaveSpaceInGarage(user_id)

		-- print(gvlimit)

		-- if gvlimit then
			if vRP.tryFullPayment(user_id,price) then
				Citizen.CreateThread(function()
					if isRented then
						vRP.execute("nation_conce/updateUserVehicle", {
							user_id = user_id, vehicle = vehicle
						})
					else 
						vRP.execute("nation_conce/addUserVehicle", {
							user_id = user_id, vehicle = vehicle, detido = 0, time = 0, engine = 1000, body = 1000, fuel = 100, ipva = os.time()
						})
					end
					mods.customPcolor = color
					vRP.setSData("custom:u"..user_id.."veh_"..vehicle,json.encode(mods))
				end)
				return true, "sucesso!"
			else
				return false, "falha no pagamento"
			end
		-- else
		-- 	return false, "negado"
		-- end
	end
	return false, "erro inesperado"
end




-- FUNÇÃO DE VENDA DO VEÍCULO

config.trySellVehicle = function(source, user_id, vehicle, price)
	if source and user_id and vehicle and price then
		local hasVehicle = #vRP.query("nation_conce/hasFullVehicle", {user_id = user_id, vehicle = vehicle}) > 0
		if hasVehicle then
			-- Citizen.CreateThread(function()
			-- 	vRP.execute("nation_conce/removeUserVehicle", {user_id = user_id, vehicle = vehicle})
			-- 	giveBankMoney(user_id,parseInt(price))
			-- end)
			--return true, "sucesso!"
			return false, "Venda Indisponível"
		else
			return false, "veículo alugado ou já vendido"
		end
	end
	return false, "erro inesperado"
end



-- VERIFICAÇÃO DE TEST DRIVE

config.tryTestDrive = function(source, user_id, info)
	if source and user_id and info then
		local price = parseInt(info.price * (config.porcentagem_testdrive / 100))
		return true, "deseja pagar <b>$ "..vRP.format(price).."</b> para realizar o test drive em um(a) <b>"..info.modelo.."</b> ?"
	end
	return false, "erro inesperado"
end



-- VERIFICAÇÃO DO PAGAMENTO DO TEST DRIVE

config.payTest = function(source,user_id, info)
	if source and user_id and info then
		local price = parseInt(info.price * (config.porcentagem_testdrive / 100))
		if vRP.tryFullPayment(user_id, price) then
			return true, "sucesso!", price
		else
			return false, "falha no pagamento"
		end
	end
	return false, "erro inesperado"
end


-- DEVOLVER O DINHEIRO CASO NÃO DÊ PARA FAZER O TEST

config.chargeBack = function(source,user_id, price)
	if source and user_id and price then
		giveDinheirama(user_id,price)
		TriggerClientEvent("Notify",source,"aviso", "Você recebeu seus <b>$ "..vRP.format(price).."</b> de volta.", 3000)
	end
end



-- VERIFICAÇÃO DE ALUGUEL DO VEÍCULO

config.tryRentVehicle = function(source, user_id, info)
	if source and user_id and info then
		local hasVehicle = #vRP.query("nation_conce/hasVehicle", {user_id = user_id, vehicle = info.name}) > 0
		if hasVehicle then
			return false, "veículo já possuído"
		end
		local price = parseInt(info.price * (config.porcentagem_aluguel / 100))
		return true, "deseja pagar <b>$ "..vRP.format(price).."</b> para alugar um(a) <b>"..info.modelo.."</b> por 1 dia?"
	end
	return false, "erro inesperado"
end




-- VERIFICAÇÃO DO PAGAMENTO DO ALUGUEL DO VEÍCULO

config.tryPayRent = function(source,user_id, info)
	if source and user_id and info then
		local price = parseInt(info.price * (config.porcentagem_aluguel / 100))
		if vRP.tryFullPayment(user_id, price) then
			Citizen.CreateThread(function()
				vRP.execute("nation_conce/addUserRentedVehicle", {
					user_id = user_id, vehicle = info.name, detido = 0, time = 0, engine = 1000, body = 1000, fuel = 100, ipva = os.time(), data_alugado = os.date("%d/%m/%Y")
				})
			end)
			return true, "sucesso!"
		else
			return false, "falha no pagamento"
		end
	end
	return false, "erro inesperado"
end

getTopList() -- pega os veículos mais caros da conce e coloca na lista de destaque


-- LOCAIS DAS CONCESSIONARIAS E REALIZAÇÃO DE TESTES

config.locais = {
	{ 
		conce = vec3(-487.69, 284.72, 83.47), 
		test_locais = {
			{ coords = vec3(-11.25,-1080.46,26.68), h = 129.4 },
			{ coords = vec3(-14.11,-1079.84,26.67), h = 122.02 },
			{ coords = vec3(-16.43,-1078.62,26.67), h = 126.74 },
			{ coords = vec3(-8.45,-1081.58,26.67), h = 117.45 },
		}
	},
	{ 
		conce = vec3(-1123.49,-1708.12,4.45),
		test_locais = {
			{ coords = vec3(-1177.30,-1743.51,4.04), h = 204.54 },
			{ coords = vec3(-1173.95,-1741.34,4.05), h = 212.41 },
			{ coords = vec3(-1171.41,-1739.55,4.07), h = 210.01 },
		} 
	},
}

