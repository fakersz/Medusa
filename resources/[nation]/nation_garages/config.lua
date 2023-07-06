local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

config = {}
Proxy.addInterface("nation_garages", config)

----------------------------------------------
----------------- CONFIG ---------------------
----------------------------------------------

config.detido = 10 -- taxa para ser paga quando o veiculo for detido (porcentagem do valor do veiculo)
config.seguradora = 5 -- taxa para ser paga quando o veiculo estiver apreendido (porcentagem do valor do veiculo)
config.ipva = 1 -- taxa para ser paga quando o veiculo estiver com o ipva atrasado (porcentagem do valor do veiculo)
config.use_tryFullPayment = true -- quando true, aceita pagamentos de taxas com o dinheiro do banco
config.dv_permission = "admin.permissao" -- permissao para dv
config.guardar_veiculo_proximo = true -- mostrar botão de guardar veículo próximo
config.client_vehicle = true -- spawn via client side

----------------------------------------------
----------------- MARKERS --------------------
----------------------------------------------


--- TIPOS DE MARKERS (DEFINIDO NO ATRIBUTO MARKER DE CADA GARAGEM) ---
config.markers = {
	["avião"] = 33,
	["helicóptero"] = 34,
	["barco"] = 35,
	["carro"] = 36,
	["moto"] = 37,
	["bicicleta"] = 38,
	["truck"] = 39,
}

config.drawMarker = function(coords,marker) -- funcao para desenhar os markers das garagens no chão
	local idTop = config.markers[marker] or config.markers["carro"] 
	local idBase = 27
	DrawMarker(idTop,coords,0,0,0,0,0,0,1.0,1.0,1.0,153, 102, 255,155,1,1,1,1)
	DrawMarker(idBase,coords.x,coords.y,coords.z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,102, 0, 255,155,0,0,0,1)
end

----------------------------------------------
----------------- BLIPS ----------------------
----------------------------------------------

config.showBlips = false -- quando true, mostra os blips das garagens públicas no mapa
config.blipId = 357 -- id do blip
config.blipColor = 7 -- cor do blip
config.blipSize = 0.4 -- tamanho do blip

----------------------------------------------
----------------------------------------------
----------------------------------------------


----------------------------------------------
-------- DELETAR VEICULOS INATIVOS -----------
----------------------------------------------

config.reset = false -- quando true, deleta os veículos que estão parados durante um determinado tempo
config.tempoReset = 60 -- tempo para deletar um veículo inativo (em minutos)

----------------------------------------------
----------------------------------------------
----------------------------------------------

----------------------------------------------
----------------- IMAGENS --------------------
----------------------------------------------

config.defaultImg = "https://svgsilh.com/svg/160895.svg" -- imagem default
config.imgDir = "http://200.9.154.104/imgfusion/vehicles/v1/" -- url ou diretorio das imagens

----------------------------------------------
----------------------------------------------
----------------------------------------------



----------------------------------------------
----------- LISTA DE VEÍCULOS ----------------
----------------------------------------------


config.vehList = {
	{ hash = 466040693, name = 'blista', price = 13500, banido = false, modelo = 'Blista', capacidade = 40, tipo = 'carros' },
	{ hash = 2046572318, name = '911turbos', price = 3100000, banido = false, modelo = 'Porsche 911', capacidade = 50, tipo = 'exclusive', class = "vip"  },
	{ hash = -915188472, name = 'amggtr', price = 1000000, banido = false, modelo = 'Mercedes AMG', capacidade = 50, tipo = 'exclusive', class = "vip"  },
	{ hash = 2047166283, name = 'bmws', price = 1000000, banido = false, modelo = 'BMW S1000', capacidade = 70, tipo = 'exclusive', class = "vip"  },
	{ hash = 1718441594, name = 'i8', price = 1000000, banido = false, modelo = 'BMW i8', capacidade = 50, tipo = 'exclusive', class = "vip"  },
	--{ hash = -1707353429, name = 'monza', price = 500000, banido = false, modelo = 'Monza', capacidade = 40, tipo = 'brasil', class = "br"  },
--	{ hash = 351980252, name = 'teslaprior', price = 190000, banido = false, modelo = 'Tesla Prior', capacidade = 50, tipo = 'import' , class = "vip"  },
	{ hash = -405833116, name = 'trailpm1', price = 1000, banido = false, modelo = 'TRAIL2 - TATICA', capacidade = 0, tipo = 'work'  },
	{ hash = -1177863319, name = 'issi2', price = 61850, banido = false, modelo = 'Issi2', capacidade = 50, tipo = 'carros'  },
	{ hash = -431692672, name = 'panto', price = 5000, banido = false, modelo = 'Panto', capacidade = 50, tipo = 'carros' },
	{ hash = -1450650718, name = 'prairie', price = 23150, banido = false, modelo = 'Prairie', capacidade = 50, tipo = 'carros'  },
	{ hash = 841808271, name = 'rhapsody', price = 7000, banido = false, modelo = 'Rhapsody', capacidade = 30, tipo = 'carros'  },
	{ hash = 330661258, name = 'cogcabrio', price = 130000, banido = false, modelo = 'Cogcabrio', capacidade = 50, tipo = 'carros'  },
	{ hash = -685276541, name = 'emperor', price = 50000, banido = false, modelo = 'Emperor', capacidade = 0, tipo = 'carros'  },
	{ hash = -1883002148, name = 'emperor2', price = 50000, banido = false, modelo = 'Emperor 2', capacidade = 50, tipo = 'carros'  },
	{ hash = -2095439403, name = 'phoenix', price = 250000, banido = false, modelo = 'Phoenix', capacidade = 0, tipo = 'carros'  },
	{ hash = -1883869285, name = 'premier', price = 35000, banido = false, modelo = 'Premier', capacidade = 0, tipo = 'carros'  },
	{ hash = 75131841, name = 'glendale', price = 70000, banido = false, modelo = 'Glendale', capacidade = 0, tipo = 'carros'  },
	{ hash = 886934177, name = 'intruder', price = 60000, banido = false, modelo = 'Intruder', capacidade = 0, tipo = 'carros'  },
	{ hash = -5153954, name = 'exemplar', price = 80000, banido = false, modelo = 'Exemplar', capacidade = 50, tipo = 'carros'  },
	{ hash = 409049982, name = 'brioso', price = 17000, banido = false, modelo = 'Brioso', capacidade = 50, tipo = 'carros'  },
	{ hash = -1122289213, name = 'zion', price = 50000, banido = false, modelo = 'Zion', capacidade = 40, tipo = 'carros'  },
	{ hash = -591610296, name = 'f620', price = 55000, banido = false, modelo = 'F620', capacidade = 50, tipo = 'carros'  },
--	{ hash = -1987109409, name = '150', price = 6000, banido = false, modelo = 'Honda 150', capacidade = 30, tipo = 'motos', class = "br"  },
	{ hash = 493030188, name = 'amarok', price = 350000, banido = false, modelo = 'VW Amarok', capacidade = 80, tipo = 'brasil', class = "br"  },
	{ hash = 2015170161, name = 'biz25', price = 3000, banido = false, modelo = 'Biz', capacidade = 30, tipo = 'motos', class = "br"  },
	{ hash = 1124490263, name = 'bros60', price = 7500, banido = false, modelo = 'Bros 160', capacidade = 30, tipo = 'motos', class = "br"  },
	--{ hash = -286676389, name = 'civic2016', price = 80000, banido = false, modelo = 'Civic 2016', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -486920242, name = 'dm1200', price = 150000, banido = false, modelo = 'Ducati 1200', capacidade = 30, tipo = 'motos', class = "br"  },
	{ hash = -1883002148, name = 'emperor2', price = 50000, banido = false, modelo = 'Emperor 2', capacidade = 50, tipo = 'carros'  },
	{ hash = 1698933548, name = 'golg7', price = 17000, banido = false, modelo = 'Gol G7', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -1761239425, name = 'hornet', price = 50000, banido = false, modelo = 'Hornet', capacidade = 30, tipo = 'motos', class = "br"  },
	{ hash = 991407206, name = 'r1250', price = 450000, banido = false, modelo = 'BMW R1250', capacidade = 15, tipo = 'motos', class = "vip"  },
	{ hash = 1876694905, name = 'veloster', price = 70000, banido = false, modelo = 'Veloster', capacidade = 50, tipo = 'brasil', class = "br"  },

	{ hash = -1777553685, name = 'xr3', price = 70000, banido = false, modelo = 'Escort', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -14519558, name = 'xj', price = 60000, banido = false, modelo = 'XJ', capacidade = 30, tipo = 'motos', class = "br"  },
	{ hash = 1826651862, name = 'xt66', price = 7500, banido = false, modelo = 'XT66', capacidade = 30, tipo = 'motos' , class = "br"  },
	--{ hash = 1744543800, name = 'z1000', price = 200000, banido = false, modelo = 'Z1000', capacidade = 20, tipo = 'motos'  },
	{ hash = -530596092, name = '2f2fgtr34', price = 0, banido = false, modelo = 'R34-Droga eo brian', capacidade = 55, tipo = 'exclusive' },
	{ hash = -1947578251, name = 'amarok17', price = 1000000, banido = false, modelo = 'amarok17', capacidade = 200, tipo = 'carros', class = "br" },
    { hash = 1890188937, name = 'aventador', price = 2500000, banido = false, modelo = 'aventador', capacidade = 70, tipo = 'import', class = "vip" },
	{ hash = 1324588753, name = 'fnfmk4', price = 0, banido = false, modelo = 'Supra', capacidade = 30, tipo = 'exclusive', class = "vip" },
	{ hash = 759625212, name = 'lanex400', price = 0, banido = false, modelo = 'Lancer ', capacidade = 30, tipo = 'exclusive', class = "vip" },

	{ hash = -972219160, name = 'm6gc', price = 99000000, banido = false, modelo = 'BMW-M6', capacidade = 70, tipo = 'exclusive', class = "vip" },
	{ hash = -1868899153, name = 'r1250', price = 99000000, banido = false, modelo = 'r1250', capacidade = 70, tipo = 'exclusive' },
	{ hash = 1025737310, name = 'rt70', price = 1000000, banido = false, modelo = 'rt70', capacidade = 70, tipo = 'carros' },
	{ hash = 1549126457, name = 'skyline', price = 99000000, banido = false, modelo = 'skyline', capacidade = 70, tipo = 'exclusive', class = "vip" },
	--{ hash = 1744543800, name = 'z1000', price = 99000000, banido = false, modelo = 'z1000', capacidade = 70, tipo = 'import' },
	{ hash = 723779872, name = 'toyotasupra', price = 190000, banido = false, modelo = 'Toyota Supra', capacidade = 50, tipo = 'import', class = "vip"  },
	{ hash = -311022263, name = 'seashark3', price = 1000, banido = false, modelo = 'Seashark3', capacidade = 0, tipo = 'work'  },
	{ hash = 493030188, name = 'amarok', price = 350000, banido = false, modelo = 'VW Amarok', capacidade = 80, tipo = 'brasil', class = "br"  },
	{ hash = 1047274985, name = 'africat', price = 1000000, banido = false, modelo = 'Honda CRF 1000', capacidade = 0, tipo = 'exclusive',  },
	{ hash = 1258059543, name = 'africa', price = 1000000, banido = false, modelo = 'Honda africa', capacidade = 0, tipo = 'exclusive', class = "vip"  },
	{ hash = 624514487, name = 'raptor2017', price = 500000, banido = false, modelo = 'Ford Raptor 2017', capacidade = 200, tipo = 'exclusive', class = "br"  },
	{ hash = -264618235, name = 'lamtmc', price = 1000000, banido = false, modelo = 'Lamborghini Terzo', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -682211828, name = 'buccaneer', price = 115000, banido = false, modelo = 'Buccaneer', capacidade = 50, tipo = 'carros'  },
	{ hash = 1549126457, name = 'brioso', price = 17000, banido = false, modelo = 'Brioso', capacidade = 50, tipo = 'carros'  },
	{ hash = -1130810103, name = 'dilettante', price = 45700, banido = false, modelo = 'Dilettante', capacidade = 50, tipo = 'carros'  },
	{ hash = -391594584, name = 'felon', price = 70000, banido = false, modelo = 'Felon', capacidade = 50, tipo = 'carros'  },
	{ hash = -1289722222, name = 'ingot', price = 160000, banido = false, modelo = 'Ingot', capacidade = 60, tipo = 'carros'  },
	{ hash = -89291282, name = 'felon2', price = 1000, banido = false, modelo = 'Felon2', capacidade = 40, tipo = 'work'  },
	{ hash = -624529134, name = 'jackal', price = 60000, banido = false, modelo = 'Jackal', capacidade = 50, tipo = 'carros'  },
	{ hash = 1348744438, name = 'oracle', price = 60000, banido = false, modelo = 'Oracle', capacidade = 50, tipo = 'carros'  },
	{ hash = -511601230, name = 'oracle2', price = 80000, banido = false, modelo = 'Oracle2', capacidade = 50, tipo = 'carros'  },
	{ hash = 1349725314, name = 'sentinel', price = 50000, banido = false, modelo = 'Sentinel', capacidade = 40, tipo = 'carros'  },
	{ hash = 873639469, name = 'sentinel2', price = 65000, banido = false, modelo = 'Sentinel2', capacidade = 50, tipo = 'carros'  },
	{ hash = 1581459400, name = 'windsor', price = 150000, banido = false, modelo = 'Windsor', capacidade = 20, tipo = 'carros'  },
	{ hash = -1930048799, name = 'windsor2', price = 170000, banido = false, modelo = 'Windsor2', capacidade = 50, tipo = 'carros'  },
	{ hash = -1122289213, name = 'zion', price = 50000, banido = false, modelo = 'Zion', capacidade = 40, tipo = 'carros'  },
	{ hash = -1193103848, name = 'zion2', price = 60000, banido = false, modelo = 'Zion2', capacidade = 50, tipo = 'carros'  },
	{ hash = -1205801634, name = 'blade', price = 110000, banido = false, modelo = 'Blade', capacidade = 40, tipo = 'carros'  },
	{ hash = -682211828, name = 'buccaneer', price = 115000, banido = false, modelo = 'Buccaneer', capacidade = 50, tipo = 'carros'  },
	{ hash = -1013450936, name = 'buccaneer2', price = 160000, banido = false, modelo = 'Buccaneer2', capacidade = 50, tipo = 'carros'  },
	{ hash = -1150599089, name = 'primo', price = 130000, banido = false, modelo = 'Primo', capacidade = 50, tipo = 'carros'  },
	{ hash = -2040426790, name = 'primo2', price = 200000, banido = false, modelo = 'Primo2', capacidade = 60, tipo = 'work'  },
	{ hash = 349605904, name = 'chino', price = 130000, banido = false, modelo = 'Chino', capacidade = 50, tipo = 'carros'  },
	{ hash = -1361687965, name = 'chino2', price = 200000, banido = false, modelo = 'Chino2', capacidade = 60, tipo = 'work'  },
	{ hash = 784565758, name = 'coquette3', price = 195000, banido = false, modelo = 'Coquette3', capacidade = 50, tipo = 'carros'  },
	{ hash = 80636076, name = 'dominator', price = 93000, banido = false, modelo = 'Dominator', capacidade = 50, tipo = 'carros'  },
	{ hash = 915704871, name = 'dominator2', price = 230000, banido = false, modelo = 'Dominator2', capacidade = 0, tipo = 'carros'  },
	{ hash = 723973206, name = 'dukes', price = 150000, banido = false, modelo = 'Dukes', capacidade = 50, tipo = 'carros'  },
	{ hash = -2119578145, name = 'faction', price = 150000, banido = false, modelo = 'Faction', capacidade = 50, tipo = 'carros'  },
	{ hash = -1790546981, name = 'faction2', price = 200000, banido = false, modelo = 'Faction2', capacidade = 50, tipo = 'work'  },
	{ hash = -2039755226, name = 'faction3', price = 350000, banido = false, modelo = 'Faction3', capacidade = 50, tipo = 'carros'  },
	{ hash = -1800170043, name = 'gauntlet', price = 100000, banido = false, modelo = 'Gauntlet', capacidade = 40, tipo = 'carros'  },
	{ hash = 349315417, name = 'gauntlet2', price = 165000, banido = false, modelo = 'Gauntlet2', capacidade = 50, tipo = 'carros'  },
	{ hash = 15219735, name = 'hermes', price = 280000, banido = false, modelo = 'Hermes', capacidade = 50, tipo = 'carros'  },
	{ hash = 37348240, name = 'hotknife', price = 180000, banido = false, modelo = 'Hotknife', capacidade = 50, tipo = 'carros'  },
	{ hash = 525509695, name = 'moonbeam', price = 220000, banido = false, modelo = 'Moonbeam', capacidade = 80, tipo = 'carros'  },
	{ hash = 1896491931, name = 'moonbeam2', price = 250000, banido = false, modelo = 'Moonbeam2', capacidade = 100, tipo = 'carros'  },
	{ hash = -1943285540, name = 'nightshade', price = 270000, banido = false, modelo = 'Nightshade', capacidade = 50, tipo = 'carros'  },
	{ hash = 1507916787, name = 'picador', price = 150000, banido = false, modelo = 'Picador', capacidade = 90, tipo = 'carros'  },
	{ hash = -227741703, name = 'ruiner', price = 150000, banido = false, modelo = 'Ruiner', capacidade = 50, tipo = 'carros'  },
	{ hash = -1685021548, name = 'sabregt', price = 260000, banido = false, modelo = 'Sabregt', capacidade = 50, tipo = 'carros'  },
	{ hash = 223258115, name = 'sabregt2', price = 150000, banido = false, modelo = 'Sabregt2', capacidade = 60, tipo = 'carros'  },
	{ hash = -1745203402, name = 'gburrito', price = 200000, banido = false, modelo = 'GBurrito', capacidade = 0, tipo = 'work'  },
	{ hash = 729783779, name = 'slamvan', price = 180000, banido = false, modelo = 'Slamvan', capacidade = 80, tipo = 'carros'  },
	{ hash = 833469436, name = 'slamvan2', price = 200000, banido = false, modelo = 'Slamvan2', capacidade = 80, tipo = 'work'  },
	{ hash = 1119641113, name = 'slamvan3', price = 230000, banido = false, modelo = 'Slamvan3', capacidade = 80, tipo = 'carros'  },
	{ hash = 1923400478, name = 'stalion', price = 150000, banido = false, modelo = 'Stalion', capacidade = 30, tipo = 'carros'  },
	{ hash = -401643538, name = 'stalion2', price = 150000, banido = false, modelo = 'Stalion2', capacidade = 0, tipo = 'carros'  },
	{ hash = -113754634, name = 'helipc', price = 1000, banido = false, modelo = 'Helicóptero', capacidade = 0, tipo = 'work'  },

	{ hash = -1905367117, name = 'pampagas', price = 1000, banido = false, modelo = 'pampagas', capacidade = 0, tipo = 'work'  },
	{ hash = 972671128, name = 'tampa', price = 170000, banido = false, modelo = 'Tampa', capacidade = 50, tipo = 'carros'  },
	{ hash = -825837129, name = 'vigero', price = 170000, banido = false, modelo = 'Vigero', capacidade = 30, tipo = 'carros'  },
	{ hash = -498054846, name = 'virgo', price = 150000, banido = false, modelo = 'Virgo', capacidade = 60, tipo = 'carros'  },
	{ hash = -899509638, name = 'virgo2', price = 250000, banido = false, modelo = 'Virgo2', capacidade = 50, tipo = 'carros'  },
	{ hash = 16646064, name = 'virgo3', price = 180000, banido = false, modelo = 'Virgo3', capacidade = 60, tipo = 'carros'  },
	{ hash = 2006667053, name = 'voodoo', price = 220000, banido = false, modelo = 'Voodoo', capacidade = 60, tipo = 'carros'  },
	{ hash = 523724515, name = 'voodoo2', price = 220000, banido = false, modelo = 'Voodoo2', capacidade = 0, tipo = 'carros'  },
	{ hash = 1871995513, name = 'yosemite', price = 350000, banido = false, modelo = 'Yosemite', capacidade = 100, tipo = 'carros'  },
	{ hash = 1126868326, name = 'bfinjection', price = 80000, banido = false, modelo = 'Bfinjection', capacidade = 50, tipo = 'carros'  },
	{ hash = -349601129, name = 'bifta', price = 61830, banido = false, modelo = 'Bifta', capacidade = 50, tipo = 'carros'  },
	{ hash = -1435919434, name = 'bodhi2', price = 170000, banido = false, modelo = 'Bodhi2', capacidade = 90, tipo = 'carros'  },
	{ hash = -1479664699, name = 'brawler', price = 250000, banido = false, modelo = 'Brawler', capacidade = 0, tipo = 'carros'  },
	{ hash = 101905590, name = 'trophytruck', price = 400000, banido = false, modelo = 'Trophytruck', capacidade = 50, tipo = 'carros'  },
	{ hash = -663299102, name = 'trophytruck2', price = 400000, banido = false, modelo = 'Trophytruck2', capacidade = 0, tipo = 'carros'  },
	{ hash = -1237253773, name = 'dubsta3', price = 300000, banido = false, modelo = 'Dubsta3', capacidade = 200, tipo = 'carros'  },
	{ hash = -2064372143, name = 'mesa3', price = 200000, banido = false, modelo = 'Mesa3', capacidade = 50, tipo = 'carros'  },
	{ hash = 1645267888, name = 'rancherxl', price = 220000, banido = false, modelo = 'Rancherxl', capacidade = 70, tipo = 'carros'  },
	{ hash = -1207771834, name = 'rebel', price = 1000, banido = false, modelo = 'Rebel', capacidade = 100, tipo = 'work'  },
	{ hash = -2045594037, name = 'rebel2', price = 250000, banido = false, modelo = 'Rebel2', capacidade = 100, tipo = 'carros'  },
	{ hash = -1532697517, name = 'riata', price = 250000, banido = false, modelo = 'Riata', capacidade = 50, tipo = 'carros'  },
	{ hash = 1770332643, name = 'dloader', price = 150000, banido = false, modelo = 'Dloader', capacidade = 40, tipo = 'carros'  },
	{ hash = -667151410, name = 'ratloader', price = 1000, banido = false, modelo = 'Caminhão', capacidade = 0, tipo = 'work'  },
	{ hash = -1189015600, name = 'sandking', price = 200000, banido = false, modelo = 'Sandking', capacidade = 100, tipo = 'carros'  },
	{ hash = 989381445, name = 'sandking2', price = 235000, banido = false, modelo = 'Sandking2', capacidade = 100, tipo = 'carros'  },
	{ hash = -808831384, name = 'baller', price = 150000, banido = false, modelo = 'Baller', capacidade = 50, tipo = 'carros'  },
	{ hash = 142944341, name = 'baller2', price = 160000, banido = false, modelo = 'Baller2', capacidade = 80, tipo = 'carros'  },
	{ hash = 1878062887, name = 'baller3', price = 175000, banido = false, modelo = 'Baller3', capacidade = 80, tipo = 'carros'  },
	{ hash = 634118882, name = 'baller4', price = 185000, banido = false, modelo = 'Baller4', capacidade = 80, tipo = 'carros'  },
	{ hash = 470404958, name = 'baller5', price = 270000, banido = false, modelo = 'Baller5', capacidade = 80, tipo = 'carros'  },
	{ hash = 666166960, name = 'baller6', price = 280000, banido = false, modelo = 'Baller6', capacidade = 120, tipo = 'carros'  },
	{ hash = 850565707, name = 'bjxl', price = 110000, banido = false, modelo = 'Bjxl', capacidade = 50, tipo = 'carros'  },
	{ hash = 2006918058, name = 'cavalcade', price = 110000, banido = false, modelo = 'Cavalcade', capacidade = 60, tipo = 'carros'  },
	{ hash = -789894171, name = 'cavalcade2', price = 130000, banido = false, modelo = 'Cavalcade2', capacidade = 60, tipo = 'carros'  },
	{ hash = 683047626, name = 'contender', price = 125000, banido = false, modelo = 'Contender', capacidade = 70, tipo = 'carros'  },
	{ hash = 1177543287, name = 'dubsta', price = 210000, banido = false, modelo = 'Dubsta', capacidade = 80, tipo = 'carros'  },
	{ hash = -394074634, name = 'dubsta2', price = 240000, banido = false, modelo = 'Dubsta2', capacidade = 80, tipo = 'carros'  },
	{ hash = -1137532101, name = 'fq2', price = 110000, banido = false, modelo = 'Fq2', capacidade = 50, tipo = 'carros'  },
	{ hash = -1775728740, name = 'granger', price = 345000, banido = false, modelo = 'Granger', capacidade = 100, tipo = 'carros'  },
	{ hash = -1543762099, name = 'gresley', price = 150000, banido = false, modelo = 'Gresley', capacidade = 50, tipo = 'carros'  },
	{ hash = 884422927, name = 'habanero', price = 110000, banido = false, modelo = 'Habanero', capacidade = 50, tipo = 'carros'  },
	{ hash = 1221512915, name = 'seminole', price = 110000, banido = false, modelo = 'Seminole', capacidade = 60, tipo = 'carros'  },
	{ hash = 1337041428, name = 'serrano', price = 150000, banido = false, modelo = 'Serrano', capacidade = 50, tipo = 'carros'  },
	{ hash = 1203490606, name = 'xls', price = 150000, banido = false, modelo = 'Xls', capacidade = 50, tipo = 'carros'  },
	{ hash = -432008408, name = 'xls2', price = 3000000, banido = false, modelo = 'Xls2', capacidade = 50, tipo = 'carros'  },
	{ hash = -1809822327, name = 'asea', price = 55000, banido = false, modelo = 'Asea', capacidade = 30, tipo = 'carros'  },
	{ hash = -1903012613, name = 'asterope', price = 65000, banido = false, modelo = 'Asterope', capacidade = 30, tipo = 'carros'  },
	{ hash = 906642318, name = 'cog55', price = 200000, banido = false, modelo = 'Cog55', capacidade = 50, tipo = 'work'  },
	{ hash = 704435172, name = 'cog552', price = 400000, banido = false, modelo = 'Cog552', capacidade = 50, tipo = 'carros'  },
	{ hash = -2030171296, name = 'cognoscenti', price = 1500000, banido = false, modelo = 'Cognoscenti', capacidade = 50, tipo = 'carros'  },
	{ hash = -604842630, name = 'cognoscenti2', price = 2000000, banido = false, modelo = 'Cognoscenti2', capacidade = 100, tipo = 'carros'  },
	{ hash = -1477580979, name = 'stanier', price = 10000, banido = false, modelo = 'Stanier', capacidade = 60, tipo = 'carros'  },
	{ hash = 1723137093, name = 'stratum', price = 90000, banido = false, modelo = 'Stratum', capacidade = 70, tipo = 'carros'  },
	{ hash = 1123216662, name = 'superd', price = 200000, banido = false, modelo = 'Superd', capacidade = 50, tipo = 'work'  },
	{ hash = -1894894188, name = 'surge', price = 110000, banido = false, modelo = 'Surge', capacidade = 60, tipo = 'carros'  },
	{ hash = -1008861746, name = 'tailgater', price = 110000, banido = false, modelo = 'Tailgater', capacidade = 50, tipo = 'carros'  },
	{ hash = 1373123368, name = 'warrener', price = 90000, banido = false, modelo = 'Warrener', capacidade = 40, tipo = 'carros'  },
	{ hash = 1777363799, name = 'washington', price = 130000, banido = false, modelo = 'Washington', capacidade = 60, tipo = 'carros'  },
	{ hash = 767087018, name = 'alpha', price = 230000, banido = false, modelo = 'Alpha', capacidade = 50, tipo = 'carros'  },
	{ hash = -1041692462, name = 'banshee', price = 300000, banido = false, modelo = 'Banshee', capacidade = 50, tipo = 'carros'  },
	{ hash = 1274868363, name = 'bestiagts', price = 200000, banido = false, modelo = 'Bestiagts', capacidade = 60, tipo = 'carros'  },
	{ hash = 1039032026, name = 'blista2', price = 55000, banido = false, modelo = 'Blista2', capacidade = 40, tipo = 'carros'  },
	{ hash = -591651781, name = 'blista3', price = 80000, banido = false, modelo = 'Blista3', capacidade = 40, tipo = 'carros'  },
	{ hash = -304802106, name = 'buffalo', price = 300000, banido = false, modelo = 'Buffalo', capacidade = 50, tipo = 'carros'  },
	{ hash = 736902334, name = 'buffalo2', price = 300000, banido = false, modelo = 'Buffalo2', capacidade = 50, tipo = 'carros'  },
	{ hash = 237764926, name = 'buffalo3', price = 300000, banido = false, modelo = 'Buffalo3', capacidade = 0, tipo = 'carros'  },
	{ hash = 2072687711, name = 'carbonizzare', price = 290000, banido = false, modelo = 'Carbonizzare', capacidade = 50, tipo = 'carros'  },
	{ hash = -1045541610, name = 'comet2', price = 250000, banido = false, modelo = 'Comet2', capacidade = 40, tipo = 'carros'  },
	{ hash = -2022483795, name = 'comet3', price = 290000, banido = false, modelo = 'Comet3', capacidade = 50, tipo = 'carros'  },
	{ hash = 661493923, name = 'comet5', price = 300000, banido = false, modelo = 'Comet5', capacidade = 50, tipo = 'carros'  },
	{ hash = 108773431, name = 'coquette', price = 250000, banido = false, modelo = 'Coquette', capacidade = 50, tipo = 'carros'  },
	{ hash = 196747873, name = 'elegy', price = 350000, banido = false, modelo = 'Elegy', capacidade = 50, tipo = 'carros'  },
	{ hash = -566387422, name = 'elegy2', price = 355000, banido = false, modelo = 'Elegy2', capacidade = 50, tipo = 'carros'  },
	{ hash = -1995326987, name = 'feltzer2', price = 255000, banido = false, modelo = 'Feltzer2', capacidade = 50, tipo = 'carros'  },
	{ hash = -1089039904, name = 'furoregt', price = 290000, banido = false, modelo = 'Furoregt', capacidade = 50, tipo = 'carros'  },
	{ hash = 499169875, name = 'fusilade', price = 210000, banido = false, modelo = 'Fusilade', capacidade = 50, tipo = 'carros'  },
	{ hash = 2016857647, name = 'futo', price = 170000, banido = false, modelo = 'Futo', capacidade = 40, tipo = 'carros'  },
	{ hash = -1297672541, name = 'jester', price = 138000, banido = false, modelo = 'Jester', capacidade = 50, tipo = 'carros'  },
	{ hash = 544021352, name = 'khamelion', price = 210000, banido = false, modelo = 'Khamelion', capacidade = 50, tipo = 'carros'  },
	{ hash = -1372848492, name = 'kuruma', price = 170000, banido = false, modelo = 'Kuruma', capacidade = 50, tipo = 'carros'  },
	{ hash = -142942670, name = 'massacro', price = 330000, banido = false, modelo = 'Massacro', capacidade = 50, tipo = 'carros'  },
	{ hash = -631760477, name = 'massacro2', price = 330000, banido = false, modelo = 'Massacro2', capacidade = 80, tipo = 'carros'  },
	{ hash = 1032823388, name = 'ninef', price = 125000, banido = false, modelo = 'Ninef', capacidade = 50, tipo = 'carros'  },
	{ hash = -1461482751, name = 'ninef2', price = 140000, banido = false, modelo = 'Ninef2', capacidade = 50, tipo = 'carros'  },
	{ hash = -777172681, name = 'omnis', price = 240000, banido = false, modelo = 'Omnis', capacidade = 20, tipo = 'carros'  },
	{ hash = 867799010, name = 'pariah', price = 500000, banido = false, modelo = 'Pariah', capacidade = 50, tipo = 'carros'  },
	{ hash = -377465520, name = 'penumbra', price = 150000, banido = false, modelo = 'Penumbra', capacidade = 50, tipo = 'carros'  },
	{ hash = -1529242755, name = 'raiden', price = 240000, banido = false, modelo = 'Raiden', capacidade = 50, tipo = 'carros'  },
	{ hash = -1934452204, name = 'rapidgt', price = 200000, banido = false, modelo = 'Rapidgt', capacidade = 50, tipo = 'carros'  },
	{ hash = 1737773231, name = 'rapidgt2', price = 300000, banido = false, modelo = 'Rapidgt2', capacidade = 50, tipo = 'carros'  },
	{ hash = 719660200, name = 'ruston', price = 370000, banido = false, modelo = 'Ruston', capacidade = 50, tipo = 'carros'  },
	{ hash = -1485523546, name = 'schafter3', price = 275000, banido = false, modelo = 'Schafter3', capacidade = 50, tipo = 'carros'  },
	{ hash = 1489967196, name = 'schafter4', price = 125000, banido = false, modelo = 'Schafter4', capacidade = 50, tipo = 'carros'  },
	{ hash = -888242983, name = 'schafter5', price = 275000, banido = false, modelo = 'Schafter5', capacidade = 0, tipo = 'carros'  },
	{ hash = -746882698, name = 'schwarzer', price = 170000, banido = false, modelo = 'Schwarzer', capacidade = 50, tipo = 'carros'  },
	{ hash = 1104234922, name = 'sentinel3', price = 89000, banido = false, modelo = 'Sentinel3', capacidade = 30, tipo = 'carros'  },
	{ hash = -1757836725, name = 'seven70', price = 370000, banido = false, modelo = 'Seven70', capacidade = 50, tipo = 'carros'  },
	{ hash = 1886268224, name = 'specter', price = 320000, banido = false, modelo = 'Specter', capacidade = 50, tipo = 'carros'  },
	{ hash = 1074745671, name = 'specter2', price = 355000, banido = false, modelo = 'Specter2', capacidade = 70, tipo = 'carros'  },
	{ hash = 1741861769, name = 'streiter', price = 250000, banido = false, modelo = 'Streiter', capacidade = 70, tipo = 'carros'  },
	{ hash = 970598228, name = 'sultan', price = 210000, banido = false, modelo = 'Sultan', capacidade = 50, tipo = 'carros'  },
	{ hash = 384071873, name = 'surano', price = 300500, banido = false, modelo = 'Surano', capacidade = 50, tipo = 'carros'  },
	{ hash = -1071380347, name = 'tampa2', price = 200000, banido = false, modelo = 'Tampa2', capacidade = 50, tipo = 'carros'  },
	{ hash = 1887331236, name = 'tropos', price = 170000, banido = false, modelo = 'Tropos', capacidade = 50, tipo = 'carros'  },
	{ hash = 1102544804, name = 'verlierer2', price = 380000, banido = false, modelo = 'Verlierer2', capacidade = 50, tipo = 'carros'  },
	{ hash = 117401876, name = 'btype', price = 200000, banido = false, modelo = 'Btype', capacidade = 40, tipo = 'work'  },
	{ hash = -831834716, name = 'btype2', price = 460000, banido = false, modelo = 'Btype2', capacidade = 50, tipo = 'carros'  },
	{ hash = -602287871, name = 'btype3', price = 60500, banido = false, modelo = 'Btype3', capacidade = 40, tipo = 'carros'  },
	{ hash = 941800958, name = 'casco', price = 355000, banido = false, modelo = 'Casco', capacidade = 50, tipo = 'carros'  },
	{ hash = -1311154784, name = 'cheetah', price = 425000, banido = false, modelo = 'Cheetah', capacidade = 70, tipo = 'carros'  },
	{ hash = 1011753235, name = 'coquette2', price = 285000, banido = false, modelo = 'Coquette2', capacidade = 50, tipo = 'carros'  },
	{ hash = -1566741232, name = 'feltzer3', price = 220000, banido = false, modelo = 'feltzer3', capacidade = 50, tipo = 'carros'},
	{ hash = -2079788230, name = 'gt500', price = 250000, banido = false, modelo = 'Gt500', capacidade = 50, tipo = 'carros'  },
	{ hash = -1405937764, name = 'infernus2', price = 250000, banido = false, modelo = 'Infernus2', capacidade = 50, tipo = 'carros'  },
	{ hash = 1051415893, name = 'jb700', price = 220000, banido = false, modelo = 'Jb700', capacidade = 30, tipo = 'carros'  },
	{ hash = -1660945322, name = 'mamba', price = 300000, banido = false, modelo = 'Mamba', capacidade = 50, tipo = 'carros'  },
	{ hash = -2124201592, name = 'manana', price = 130000, banido = false, modelo = 'Manana', capacidade = 70, tipo = 'carros'  },
	{ hash = -433375717, name = 'monroe', price = 260000, banido = false, modelo = 'Monroe', capacidade = 20, tipo = 'carros'  },
	{ hash = 1830407356, name = 'peyote', price = 150000, banido = false, modelo = 'Peyote', capacidade = 70, tipo = 'carros'  },
	{ hash = 1078682497, name = 'pigalle', price = 250000, banido = false, modelo = 'Pigalle', capacidade = 60, tipo = 'carros'  },
	{ hash = 2049897956, name = 'rapidgt3', price = 123000, banido = false, modelo = 'Rapidgt3', capacidade = 50, tipo = 'carros'  },
	{ hash = 1841130506, name = 'retinue', price = 150000, banido = false, modelo = 'Retinue', capacidade = 40, tipo = 'carros'  },
	{ hash = 1545842587, name = 'stinger', price = 220000, banido = false, modelo = 'Stinger', capacidade = 60, tipo = 'carros'  },
	{ hash = -2098947590, name = 'stingergt', price = 230000, banido = false, modelo = 'Stingergt', capacidade = 20, tipo = 'carros'  },
	{ hash = 1504306544, name = 'torero', price = 160000, banido = false, modelo = 'Torero', capacidade = 30, tipo = 'carros'  },
	{ hash = 464687292, name = 'tornado', price = 150000, banido = false, modelo = 'Tornado', capacidade = 70, tipo = 'carros'  },
	{ hash = 1531094468, name = 'tornado2', price = 160000, banido = false, modelo = 'Tornado2', capacidade = 60, tipo = 'carros'  },
	{ hash = -1797613329, name = 'tornado5', price = 200000, banido = false, modelo = 'Tornado5', capacidade = 60, tipo = 'work'  },
	{ hash = -1558399629, name = 'tornado6', price = 250000, banido = false, modelo = 'Tornado6', capacidade = 0, tipo = 'carros'  },
	{ hash = -982130927, name = 'turismo2', price = 250000, banido = false, modelo = 'Turismo2', capacidade = 50, tipo = 'carros'  },
	{ hash = 758895617, name = 'ztype', price = 400000, banido = false, modelo = 'Ztype', capacidade = 50, tipo = 'carros'  },
	{ hash = -1216765807, name = 'adder', price = 620000, banido = false, modelo = 'Adder', capacidade = 50, tipo = 'carros'  },
	{ hash = -313185164, name = 'autarch', price = 760000, banido = false, modelo = 'Autarch', capacidade = 50, tipo = 'carros'  },
	{ hash = 633712403, name = 'banshee2', price = 370000, banido = false, modelo = 'Banshee2', capacidade = 50, tipo = 'carros'  },
	{ hash = -1696146015, name = 'bullet', price = 400000, banido = false, modelo = 'Bullet', capacidade = 50, tipo = 'carros'  },
	{ hash = 223240013, name = 'cheetah', price = 425000, banido = false, modelo = 'Cheetah', capacidade = 70, tipo = 'carros'  },
	{ hash = -1291952903, name = 'entityxf', price = 460000, banido = false, modelo = 'Entityxf', capacidade = 50, tipo = 'carros'  },
	{ hash = 1426219628, name = 'fmj', price = 520000, banido = false, modelo = 'Fmj', capacidade = 50, tipo = 'carros'  },
	{ hash = 1234311532, name = 'gp1', price = 495000, banido = false, modelo = 'Gp1', capacidade = 50, tipo = 'carros'  },
	{ hash = 418536135, name = 'infernus', price = 470000, banido = false, modelo = 'Infernus', capacidade = 50, tipo = 'carros'  },
	{ hash = 1034187331, name = 'nero', price = 450000, banido = false, modelo = 'Nero', capacidade = 80, tipo = 'carros'  },
	{ hash = 1093792632, name = 'nero2', price = 480000, banido = false, modelo = 'Nero2', capacidade = 50, tipo = 'carros'  },
	{ hash = 1987142870, name = 'osiris', price = 460000, banido = false, modelo = 'Osiris', capacidade = 50, tipo = 'carros'  },
	{ hash = -1758137366, name = 'penetrator', price = 480000, banido = false, modelo = 'Penetrator', capacidade = 20, tipo = 'carros'  },
	{ hash = -1829802492, name = 'pfister811', price = 530000, banido = false, modelo = 'Pfister811', capacidade = 50, tipo = 'carros'  },
	{ hash = 234062309, name = 'reaper', price = 620000, banido = false, modelo = 'Reaper', capacidade = 50, tipo = 'carros'  },
	{ hash = 1352136073, name = 'sc1', price = 495000, banido = false, modelo = 'Sc1', capacidade = 50, tipo = 'carros'  },
	{ hash = -295689028, name = 'sultanrs', price = 450000, banido = false, modelo = 'Sultan RS', capacidade = 50, tipo = 'carros'  },
	{ hash = 1663218586, name = 't20', price = 670000, banido = false, modelo = 'T20', capacidade = 50, tipo = 'carros'  },
	{ hash = 272929391, name = 'tempesta', price = 600000, banido = false, modelo = 'Tempesta', capacidade = 50, tipo = 'carros'  },
	{ hash = 408192225, name = 'turismor', price = 620000, banido = false, modelo = 'Turismor', capacidade = 50, tipo = 'carros'  },
	{ hash = 2067820283, name = 'tyrus', price = 620000, banido = false, modelo = 'Tyrus', capacidade = 50, tipo = 'carros'  },
	{ hash = 338562499, name = 'vacca', price = 620000, banido = false, modelo = 'Vacca', capacidade = 50, tipo = 'carros'  },
	{ hash = -998177792, name = 'visione', price = 690000, banido = false, modelo = 'Visione', capacidade = 50, tipo = 'carros'  },
	{ hash = -1622444098, name = 'voltic', price = 440000, banido = false, modelo = 'Voltic', capacidade = 50, tipo = 'carros'  },
	{ hash = -1403128555, name = 'zentorno', price = 920000, banido = false, modelo = 'Zentorno', capacidade = 50, tipo = 'carros'  },
	{ hash = -599568815, name = 'sadler', price = 180000, banido = false, modelo = 'Sadler', capacidade = 70, tipo = 'carros'  },
	{ hash = -16948145, name = 'bison', price = 220000, banido = false, modelo = 'Bison', capacidade = 50, tipo = 'carros'  },
	{ hash = 2072156101, name = 'bison2', price = 180000, banido = false, modelo = 'Bison2', capacidade = 50, tipo = 'carros'  },
	{ hash = 1069929536, name = 'bobcatxl', price = 260000, banido = false, modelo = 'Bobcatxl', capacidade = 100, tipo = 'carros'  },
	{ hash = -1346687836, name = 'burrito', price = 200000, banido = false, modelo = 'Burrito', capacidade = 100, tipo = 'carros'  },
	{ hash = -907477130, name = 'burrito2', price = 150000, banido = false, modelo = 'Burrito2', capacidade = 100, tipo = 'carros'  },
	{ hash = -1743316013, name = 'burrito3', price = 260000, banido = false, modelo = 'Burrito3', capacidade = 50, tipo = 'carros'  },
	{ hash = 893081117, name = 'burrito4', price = 260000, banido = false, modelo = 'Burrito4', capacidade = 100, tipo = 'carros', class = "vip"  },
	{ hash = -310465116, name = 'minivan', price = 110000, banido = false, modelo = 'Minivan', capacidade = 70, tipo = 'carros'  },
	{ hash = -1126264336, name = 'minivan2', price = 220000, banido = false, modelo = 'Minivan2', capacidade = 60, tipo = 'carros'  },
	{ hash = 1488164764, name = 'paradise', price = 260000, banido = false, modelo = 'Paradise', capacidade = 100, tipo = 'carros'  },
	{ hash = -119658072, name = 'pony', price = 260000, banido = false, modelo = 'Pony', capacidade = 100, tipo = 'carros'  },
	{ hash = 943752001, name = 'pony2', price = 260000, banido = false, modelo = 'Pony2', capacidade = 100, tipo = 'carros'  },
	{ hash = 1162065741, name = 'rumpo', price = 100000, banido = false, modelo = 'Rumpo', capacidade = 100, tipo = 'carros'  },
	{ hash = -1776615689, name = 'rumpo2', price = 260000, banido = false, modelo = 'Rumpo2', capacidade = 100, tipo = 'carros'  },
	{ hash = 1475773103, name = 'rumpo3', price = 350000, banido = false, modelo = 'Rumpo3', capacidade = 250, tipo = 'carros'  },
	{ hash = -810318068, name = 'speedo', price = 200000, banido = false, modelo = 'Speedo', capacidade = 100, tipo = 'work'  },
	{ hash = 699456151, name = 'surfer', price = 55000, banido = false, modelo = 'Surfer', capacidade = 50, tipo = 'carros'  },
	{ hash = 65402552, name = 'youga', price = 260000, banido = false, modelo = 'Youga', capacidade = 100, tipo = 'carros'  },
	{ hash = 1026149675, name = 'youga2', price = 1000, banido = false, modelo = 'Youga2', capacidade = 100, tipo = 'work'  },
	{ hash = -1207771834, name = 'rebel', price = 1000, banido = false, modelo = 'Rebel', capacidade = 100, tipo = 'work'  },
	{ hash = -2076478498, name = 'tractor2', price = 1000, banido = false, modelo = 'Tractor2', capacidade = 0, tipo = 'work'  },
	{ hash = 486987393, name = 'huntley', price = 110000, banido = false, modelo = 'Huntley', capacidade = 50, tipo = 'carros'  },
	{ hash = 1269098716, name = 'landstalker', price = 130000, banido = false, modelo = 'Landstalker', capacidade = 70, tipo = 'carros'  },
	{ hash = 914654722, name = 'mesa', price = 90000, banido = false, modelo = 'Mesa', capacidade = 50, tipo = 'carros'  },
	{ hash = -808457413, name = 'patriot', price = 250000, banido = false, modelo = 'Patriot', capacidade = 70, tipo = 'carros'  },
	{ hash = -1651067813, name = 'radi', price = 110000, banido = false, modelo = 'Radi', capacidade = 50, tipo = 'carros'  },
	{ hash = 2136773105, name = 'rocoto', price = 110000, banido = false, modelo = 'Rocoto', capacidade = 50, tipo = 'carros'  },
	{ hash = -376434238, name = 'tyrant', price = 690000, banido = false, modelo = 'Tyrant', capacidade = 50, tipo = 'carros'  },
	{ hash = -2120700196, name = 'entity2', price = 550000, banido = false, modelo = 'Entity2', capacidade = 50, tipo = 'carros'  },
--{ hash = 515734555, name = 'astra', price = 40000, banido = false, modelo = 'Astra', capacidade = 50, tipo = 'brasil'  },
	{ hash = -997601910, name = 'cronos', price = 57000, banido = false, modelo = 'Fiat Cronos', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -193064196, name = 'escort', price = 10000, banido = false, modelo = 'Escort', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 1924372706, name = 'fusca', price = 18000, banido = false, modelo = 'Fusca', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 1547680982, name = 'hilux2016', price = 300000, banido = false, modelo = 'Hilux 2016', capacidade = 200, tipo = 'brasil', class = "br"  },

	{ hash = 1475773103, name = 'rumpo3', price = 350000, banido = false, modelo = 'Rumpo3', capacidade = 250, tipo = 'carros', class = "vip"  },
	{ hash = 701696699, name = 'jetta', price = 80000, banido = false, modelo = 'Jetta', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -1961924436, name = 'palio97', price = 10000, banido = false, modelo = 'Palio 97', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -1773424714, name = 'passat', price = 90000, banido = false, modelo = 'Passat', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 1062355240, name = 'uno', price = 25000, banido = false, modelo = 'Uno', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 519002268, name = 'versa', price = 40000, banido = false, modelo = 'Nissan Versa', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -2007010518, name = 'fiesta', price = 35000, banido = false, modelo = 'New Fiesta', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 547134075, name = 'mclarenp1', price = 1900000, banido = false, modelo = 'McLaren P1', capacidade = 50, tipo = 'exclusive', class = "vip"  },
	{ hash = -988501280, name = 'cheburek', price = 170000, banido = false, modelo = 'Cheburek', capacidade = 50, tipo = 'carros'  },
	{ hash = 1115909093, name = 'hotring', price = 300000, banido = false, modelo = 'Hotring', capacidade = 60, tipo = 'carros'  },
	{ hash = -214906006, name = 'jester3', price = 345000, banido = false, modelo = 'Jester3', capacidade = 50, tipo = 'carros'  },
	{ hash = -1259134696, name = 'flashgt', price = 370000, banido = false, modelo = 'Flashgt', capacidade = 50, tipo = 'carros'  },
	{ hash = -1267543371, name = 'ellie', price = 100000, banido = false, modelo = 'Ellie', capacidade = 50, tipo = 'carros'  },
	{ hash = 515734555, name = 'astra', price = 80000, banido = false, modelo = 'Astra', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 1995020435, name = 'celta', price = 120000, banido = false, modelo = 'Celta Paredão', capacidade = 50, tipo = 'brasil', class = "br"  },

	{ hash = 134028651, name = 'voyage', price = 120000, banido = false, modelo = 'voyage', capacidade = 30, tipo = 'brasil', class = "br"  },


		--=====================BRASIL MOTOS=================
		{ hash = 735175855, name = 'cbrr', price = 100000, banido = false, modelo = 'CBR 1000RR', capacidade = 20, tipo = 'motos', class = "vip"  },
		{ hash = 1474015055, name = 'r1', price = 600000, banido = false, modelo = 'Yamaha R1', capacidade = 70, tipo = 'motos', class = "vip"  },
	--	{ hash = -1987109409, name = '150', price = 6000, banido = false, modelo = 'Honda 150', capacidade = 30, tipo = 'motos'},
		{ hash = 1744543800, name = 'z1000', price = 200000, banido = false, modelo = 'Z1000', capacidade = 20, tipo = 'motos' },
		{ hash = 1826651862, name = 'xt66', price = 35000, banido = false, modelo = 'XT66', capacidade = 30, tipo = 'motos' },
		{ hash = 1124490263, name = 'bros60', price = 35000, banido = false, modelo = 'Bros 160', capacidade = 30, tipo = 'motos' },
		{ hash = -486920242, name = 'dm1200', price = 550000, banido = false, modelo = 'Ducati 1200', capacidade = 30, tipo = 'motos' },

		{ hash = -188978926, name = 'r6', price = 950000, banido = false, modelo = 'Yamaha R6', capacidade = 20, tipo = 'motos', class = "vip"  },
		{ hash = -1156537658, name = 'tiger', price = 820000, banido = false, modelo = 'TIGER 800', capacidade = 30, tipo = 'motos', class = "vip"  },
		{ hash = -1156537658, name = '160chumbo', price = 820000, banido = false, modelo = 'CG 160', capacidade = 30, tipo = 'motos' },
		--=====================BRASIL=================
	
		{ hash = 493030188, name = 'amarok', price = 550000, banido = false, modelo = 'VW Amarok', capacidade = 100, tipo = 'brasil' },
	
		--{ hash = 1744543800, name = 'z1000', price = 200000, banido = false, modelo = 'Z1000', capacidade = 20, tipo = 'motos'    },
		{ hash = 46103174, name = 'brasilia', price = 25000, banido = false, modelo = 'Brasilia', capacidade = 30, tipo = 'brasil'    },
		{ hash = -1444047101, name = 'bugatti', price = 1900000, banido = false, modelo = 'Bugatti', capacidade = 50, tipo = 'import', class = "vip"  },
		{ hash = -1721911377, name = 'clio', price = 40000, banido = false, modelo = 'Clio', capacidade = 50, tipo = 'brasil'    },

		{ hash = -1365970431, name = 's10pequi', price = 1900000, banido = false, modelo = 's10 Monstro', capacidade = 30, tipo = 'exclusive', class = "vip"  },
		{ hash = 1833236016, name = 'corvette', price = 1900000, banido = false, modelo = 'Corvette', capacidade = 30, tipo = 'exclusive', class = "vip"  },
		{ hash = 1833236016, name = 'corvette', price = 1900000, banido = false, modelo = 'Corvette', capacidade = 30, tipo = 'exclusive', class = "vip"  },

		{ hash = 1833236016, name = 'corvette', price = 1900000, banido = false, modelo = 'Corvette', capacidade = 30, tipo = 'exclusive', class = "vip"  },
		{ hash = -193064196, name = 'escort', price = 45000, banido = false, modelo = 'Escort', capacidade = 50, tipo = 'brasil'    },
		{ hash = 1663453404, name = 'evoque', price = 1000000, banido = false, modelo = 'Ranger Rover Evoque', capacidade = 50, tipo = 'exclusive'  },
		{ hash = -2007010518, name = 'fiesta', price = 35000, banido = false, modelo = 'New Fiesta', capacidade = 50, tipo = 'brasil'    },
		{ hash = -252643265, name = 'ftoro', price = 500000, banido = false, modelo = 'Fiat Toro', capacidade = 50, tipo = 'brasil'    },
		{ hash = 1518533038, name = 'hauler', price = 1000000, banido = false, modelo = 'Caminhão', capacidade = 50, tipo = 'work'  },
		{ hash = 387748548, name = 'hauler2', price = 1000000, banido = false, modelo = 'Caminhão', capacidade = 50, tipo = 'work'  },
		{ hash = -934181946, name = 'paratigls', price = 1900000, banido = false, modelo = 'paratigls P1', capacidade = 50, tipo = 'exclusive', class = "vip"  },
		{ hash = -1120398581, name = 'omega', price = 30000, banido = false, modelo = 'Omega', capacidade = 50, tipo = 'brasil'    },
		{ hash = 648352964, name = 'parati2007', price = 33000, banido = false, modelo = 'Parati 2007', capacidade = 50, tipo = 'brasil'  },
		{ hash = -1281076242, name = 'peugeot207', price = 60000, banido = false, modelo = 'Peugeot 207', capacidade = 50, tipo = 'brasil'  },
		{ hash = -2137348917, name = 'phantom', price = 1000000, banido = false, modelo = 'Caminhão', capacidade = 50, tipo = 'work'  },
		{ hash = 1125130375, name = 'polo', price = 25000, banido = false, modelo = 'Polo', capacidade = 50, tipo = 'brasil'    },
		{ hash = 515734555, name = 'astra', price = 80000, banido = false, modelo = 'Astra', capacidade = 50, tipo = 'brasil'    },
		{ hash = -1456558572, name = 'chevette', price = 30000, banido = false, modelo = 'Chevette', capacidade = 30, tipo = 'brasil'    },
		{ hash = -380340310, name = 'corsa98', price = 50000, banido = false, modelo = 'Corsa 98', capacidade = 30, tipo = 'brasil'    },
		{ hash = -997601910, name = 'cronos', price = 57000, banido = false, modelo = 'Fiat Cronos', capacidade = 50, tipo = 'brasil'    },
		{ hash = 1924372706, name = 'fusca', price = 18000, banido = false, modelo = 'Fusca', capacidade = 50, tipo = 'brasil'    },
		{ hash = 1698933548, name = 'golg7', price = 270000, banido = false, modelo = 'Gol G7', capacidade = 50, tipo = 'brasil'    },
		{ hash = 1547680982, name = 'hilux2016', price = 300000, banido = false, modelo = 'Hilux 2016', capacidade = 200, tipo = 'brasil'    },
		{ hash = 701696699, name = 'jetta', price = 500000, banido = false, modelo = 'Jetta', capacidade = 50, tipo = 'brasil'    },
		{ hash = -1961924436, name = 'palio97', price = 10000, banido = false, modelo = 'Palio 97', capacidade = 50, tipo = 'brasil'    },
		{ hash = -1773424714, name = 'passat', price = 300000, banido = false, modelo = 'Passat', capacidade = 50, tipo = 'brasil'    },
		{ hash = -110704625, name = 's10', price = 450000, banido = false, modelo = 'S10', capacidade = 100, tipo = 'brasil'    },
		{ hash = -1718750914, name = 'saveirog6', price = 300000, banido = false, modelo = 'Saveiro G6', capacidade = 50, tipo = 'brasil'    },
		{ hash = -419705714, name = 'tritonhpe', price = 250000, banido = false, modelo = 'Triton', capacidade = 100, tipo = 'brasil'    },
		{ hash = 1062355240, name = 'uno', price = 25000, banido = false, modelo = 'Uno', capacidade = 50, tipo = 'brasil'    },
		{ hash = 519002268, name = 'versa', price = 40000, banido = false, modelo = 'Nissan Versa', capacidade = 50, tipo = 'brasil'},
	
	
		{ hash = 515734555, name = 'astra', price = 80000, banido = false, modelo = 'Astra', capacidade = 50, tipo = 'brasil' },
		{ hash = 1995020435, name = 'celta', price = 120000, banido = false, modelo = 'Celta Paredão', capacidade = 50, tipo = 'brasil' },
	
		{ hash = 134028651, name = 'voyage', price = 500000, banido = false, modelo = 'voyage', capacidade = 30, tipo = 'brasil' },
	
		{ hash = 15800661238, name = 'baller250', price = 5000000, banido = false, modelo = 'F250', capacidade = 30, tipo = 'brasil', class = "br"  },
		{ hash = -1978168465, name = 'hondacivictr', price = 5000000, banido = false, modelo = 'Honda civictr', capacidade = 30, tipo = 'brasil', class = "vip"  },
		{ hash = -1456558572, name = 'chevette', price = 30000, banido = false, modelo = 'Chevette', capacidade = 30, tipo = 'brasil' },
		{ hash = -380340310, name = 'corsa98', price = 50000, banido = false, modelo = 'Corsa 98', capacidade = 30, tipo = 'brasil' },
		{ hash = -997601910, name = 'cronos', price = 57000, banido = false, modelo = 'Fiat Cronos', capacidade = 50, tipo = 'brasil' },
		{ hash = -193064196, name = 'escort', price = 45000, banido = false, modelo = 'Escort', capacidade = 50, tipo = 'brasil'  },
		{ hash = 1924372706, name = 'fusca', price = 18000, banido = false, modelo = 'Fusca', capacidade = 50, tipo = 'brasil'  },
		{ hash = 1698933548, name = 'golg7', price = 270000, banido = false, modelo = 'Gol G7', capacidade = 50, tipo = 'brasil' },
		{ hash = 1547680982, name = 'hilux2016', price = 300000, banido = false, modelo = 'Hilux 2016', capacidade = 200, tipo = 'brasil'  },
		{ hash = 701696699, name = 'jetta', price = 500000, banido = false, modelo = 'Jetta', capacidade = 50, tipo = 'brasil' },
		{ hash = -1961924436, name = 'palio97', price = 10000, banido = false, modelo = 'Palio 97', capacidade = 50, tipo = 'brasil'},
		{ hash = -1773424714, name = 'passat', price = 300000, banido = false, modelo = 'Passat', capacidade = 50, tipo = 'brasil' },
		{ hash = -110704625, name = 's10', price = 450000, banido = false, modelo = 'S10', capacidade = 100, tipo = 'brasil' },
		{ hash = -1718750914, name = 'saveirog6', price = 30000, banido = false, modelo = 'Saveiro G6', capacidade = 50, tipo = 'brasil' },
		{ hash = -419705714, name = 'tritonhpe', price = 250000, banido = false, modelo = 'Triton', capacidade = 100, tipo = 'brasil' },
		{ hash = 1062355240, name = 'uno', price = 25000, banido = false, modelo = 'Uno', capacidade = 50, tipo = 'brasil' },
		{ hash = 519002268, name = 'versa', price = 40000, banido = false, modelo = 'Nissan Versa', capacidade = 50, tipo = 'brasil' },
		{ hash = 46103174, name = 'brasilia', price = 25000, banido = false, modelo = 'Brasilia', capacidade = 30, tipo = 'brasil' },
		{ hash = -286676389, name = 'civic2016', price = 350000, banido = false, modelo = 'Civic 2016', capacidade = 50, tipo = 'brasil', class = "br"  },
		{ hash = -1721911377, name = 'clio', price = 40000, banido = false, modelo = 'Clio', capacidade = 50, tipo = 'brasil' },
		{ hash = -810451130, name = 'cruze', price = 80000, banido = false, modelo = 'Cruze', capacidade = 50, tipo = 'brasil' },
		{ hash = 1663453404, name = 'evoque', price = 1000000, banido = false, modelo = 'Ranger Rover Evoque', capacidade = 50, tipo = 'exclusive'  },
		{ hash = -2007010518, name = 'fiesta', price = 35000, banido = false, modelo = 'New Fiesta', capacidade = 50, tipo = 'brasil' },
		{ hash = -252643265, name = 'ftoro', price = 500000, banido = false, modelo = 'Fiat Toro', capacidade = 50, tipo = 'brasil'  },
		{ hash = -1120398581, name = 'omega', price = 30000, banido = false, modelo = 'Omega', capacidade = 50, tipo = 'brasil' },
		{ hash = 648352964, name = 'parati2007', price = 33000, banido = false, modelo = 'Parati 2007', capacidade = 50, tipo = 'brasil' },
		{ hash = -1281076242, name = 'peugeot207', price = 60000, banido = false, modelo = 'Peugeot 207', capacidade = 50, tipo = 'brasil' },
		{ hash = 1876694905, name = 'veloster', price = 70000, banido = false, modelo = 'Veloster', capacidade = 50, tipo = 'brasil' },
		{ hash = 1833236016, name = 'corvette', price = 1900000, banido = false, modelo = 'Corvette', capacidade = 30, tipo = 'exclusive'},
		{ hash = -1444047101, name = 'bugatti', price = 1900000, banido = false, modelo = 'Bugatti', capacidade = 50, tipo = 'import' },
		{ hash = 1047274985, name = 'africat', price = 1000000, banido = false, modelo = 'Honda CRF 1000', capacidade = 0, tipo = 'exclusive'  },
		
		--=====================VIP====================
		{ hash = -1173768715, name = 'ferrariitalia', price = 3000000, banido = false, modelo = 'Ferrari Italia 478', capacidade = 20, tipo = 'exclusive', class = "vip"  },
	
		{ hash = -1761239425, name = 'hornet', price = 500000, banido = false, modelo = 'Hornet', capacidade = 30, tipo = 'motos'   },
		{ hash = 342059638, name = 'xj6', price = 500000, banido = false, modelo = 'xj6', capacidade = 30, tipo = 'motos'   },
		{ hash = -16839848, name = 'xjturbo', price = 500000, banido = false, modelo = 'xjturbo', capacidade = 30, tipo = 'motos'   },
		{ hash = -124294908, name = 'b63s', price = 1000000, banido = false, modelo = 'b63s', capacidade = 50, tipo = 'import'   },
		{ hash = 1093697054, name = 'bmci', price = 800000, banido = false, modelo = 'bmci', capacidade = 50, tipo = 'import', class = "vip"  },
		{ hash = 1050169281, name = 'eb110', price = 700000, banido = false, modelo = 'eb110', capacidade = 50, tipo = 'import', class = "br"  },
		{ hash = -1543097373, name = 'f80', price = 800000, banido = false, modelo = 'f80', capacidade = 50, tipo = 'import', class = "vip"  },
		{ hash = 1651538600, name = 'f458', price = 800000, banido = false, modelo = 'f458', capacidade = 50, tipo = 'import', class = "vip"  },
		{ hash = -1919297986, name = 'fpacehm', price = 900000, banido = false, modelo = 'fpacehm', capacidade = 50, tipo = 'import'   },
		{ hash = -1019985014, name = 'jagpr8', price = 600000, banido = false, modelo = 'jagpr8', capacidade = 50, tipo = 'import', class = "vip"  },
		{ hash = 381357986, name = 'lx2018', price = 900000, banido = false, modelo = 'lx2018', capacidade = 50, tipo = 'import', class = "vip"  },
		{ hash = 909765281, name = 'm4f82', price = 800000, banido = false, modelo = 'm4f82', capacidade = 50, tipo = 'import', class = "vip"  },
		--{ hash = -972219160, name = 'm6gc', price = 500000, banido = false, modelo = 'm6gc', capacidade = 50, tipo = 'import'   },
		{ hash = -1584460854, name = 'ff4wrx', price = 800000, banido = false, modelo = 'ff4wrx', capacidade = 50, tipo = 'import'   },
		{ hash = -410866473, name = 'fnflan', price = 700000, banido = false, modelo = 'fnflan', capacidade = 50, tipo = 'import'   },
		{ hash = 1324588753, name = 'fnfmk4', price = 800000, banido = false, modelo = 'fnfmk4', capacidade = 50, tipo = 'import'   },
	
		{ hash = -2118433882, name = 'hcej1', price = 500000, banido = false, modelo = 'hcej1', capacidade = 50, tipo = 'import'   },
		{ hash = -372000475, name = 'fmgt', price = 1200000, banido = false, modelo = 'fmgt', capacidade = 50, tipo = 'import', class = "vip"  },
		{ hash = -635747987, name = 'italia458', price = 1500000, banido = false, modelo = 'italia458', capacidade = 50, tipo = 'import', class = "vip"  },
		{ hash = 1421669475, name = 'laferrari17', price = 1200000, banido = false, modelo = 'laferrari17', capacidade = 50, tipo = 'import', class = "vip"  },
		--{ hash = -972219160, name = 'm6gc', price = 1500000, banido = false, modelo = 'm6gc', capacidade = 50, tipo = 'import'   },
		{ hash = 1025737310, name = 'rt70', price = 1200000, banido = false, modelo = 'rt70', capacidade = 50, tipo = 'import'   },
		{ hash = 1324588753, name = 'fnfmk4', price = 500000, banido = false, modelo = 'fnfmk4', capacidade = 50, tipo = 'import'   },
	--	{ hash = 194366558, name = 'panamera17turbo', price = 500000, banido = false, modelo = 'panamera17turbo', capacidade = 30, tipo = 'import'   },
		{ hash = -1698677681, name = 'rmodlp750', price = 1200000, banido = false, modelo = 'rmodlp750', capacidade = 30, tipo = 'import' , class = "vip"  },
		{ hash = 62986539, name = 'rmodveneno', price = 1200000, banido = false, modelo = 'rmodveneno', capacidade = 30, tipo = 'import', class = "vip"  },
		{ hash = 1752384486, name = 'rx7veilside', price = 1200000, banido = false, modelo = 'rx7veilside', capacidade = 30, tipo = 'import', class = "vip"  },
		--{ hash = 2117711508, name = 'skyline', price = 500000, banido = false, modelo = 'skyline', capacidade = 30, tipo = 'import'   },
		{ hash =  310570430, name = 'velociraptor', price = 500000, banido = false, modelo = 'velociraptor', capacidade = 30, tipo = 'import' , class = "vip"  },
		{ hash = -688419137, name = 'hayabusa', price = 1000000, banido = false, modelo = 'hayabusa', capacidade = 30, tipo = 'motos', class = "vip"  },
	--	{ hash = 1671178289, name = 'd99', price = 500000, banido = false, modelo = 'd99', capacidade = 30, tipo = 'motos', class = "vip"  },
        { hash = -1474280704, name = 'hvrod', price = 500000, banido = false, modelo = 'hvrod', capacidade = 30, tipo = 'motos', class = "vip"  },
	{ hash = 15800661238, name = 'baller250', price = 5000000, banido = false, modelo = 'F250', capacidade = 30, tipo = 'brasil', class = "br"  },
	{ hash = -1456558572, name = 'chevette', price = 30000, banido = false, modelo = 'Chevette', capacidade = 30, tipo = 'brasil', class = "br"  },
	{ hash = -380340310, name = 'corsa98', price = 50000, banido = false, modelo = 'Corsa 98', capacidade = 30, tipo = 'brasil', class = "br"  },
	{ hash = -997601910, name = 'cronos', price = 57000, banido = false, modelo = 'Fiat Cronos', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -193064196, name = 'escort', price = 45000, banido = false, modelo = 'Escort', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 1924372706, name = 'fusca', price = 18000, banido = false, modelo = 'Fusca', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 1698933548, name = 'golg7', price = 17000, banido = false, modelo = 'Gol G7', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 1547680982, name = 'hilux2016', price = 300000, banido = false, modelo = 'Hilux 2016', capacidade = 200, tipo = 'brasil', class = "br"  },
	{ hash = 701696699, name = 'jetta', price = 80000, banido = false, modelo = 'Jetta', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -1961924436, name = 'palio97', price = 10000, banido = false, modelo = 'Palio 97', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -1773424714, name = 'passat', price = 90000, banido = false, modelo = 'Passat', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -110704625, name = 's10', price = 450000, banido = false, modelo = 'S10', capacidade = 100, tipo = 'brasil', class = "br"  },
	{ hash = -1718750914, name = 'saveirog6', price = 30000, banido = false, modelo = 'Saveiro G6', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -419705714, name = 'tritonhpe', price = 250000, banido = false, modelo = 'Triton', capacidade = 100, tipo = 'brasil', class = "br"  },
	{ hash = 1062355240, name = 'uno', price = 25000, banido = false, modelo = 'Uno', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 519002268, name = 'versa', price = 40000, banido = false, modelo = 'Nissan Versa', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 46103174, name = 'brasilia', price = 25000, banido = false, modelo = 'Brasilia', capacidade = 30, tipo = 'brasil', class = "br"  },
	--{ hash = -286676389, name = 'civic2016', price = 80000, banido = false, modelo = 'Civic 2016', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -1721911377, name = 'clio', price = 40000, banido = false, modelo = 'Clio', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -810451130, name = 'cruze', price = 80000, banido = false, modelo = 'Cruze', capacidade = 0, tipo = 'brasil', class = "br"  },
	{ hash = 1663453404, name = 'evoque', price = 1000000, banido = false, modelo = 'Ranger Rover Evoque', capacidade = 50, tipo = 'exclusive'  },
	{ hash = -2007010518, name = 'fiesta', price = 35000, banido = false, modelo = 'New Fiesta', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -252643265, name = 'ftoro', price = 80000, banido = false, modelo = 'Fiat Toro', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -1120398581, name = 'omega', price = 30000, banido = false, modelo = 'Omega', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 648352964, name = 'parati2007', price = 33000, banido = false, modelo = 'Parati 2007', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -1281076242, name = 'peugeot207', price = 60000, banido = false, modelo = 'Peugeot 207', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 1876694905, name = 'veloster', price = 70000, banido = false, modelo = 'Veloster', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 1833236016, name = 'corvette', price = 1900000, banido = false, modelo = 'Corvette', capacidade = 30, tipo = 'exclusive', class = "vip"  },
	{ hash = -1444047101, name = 'bugatti', price = 1900000, banido = false, modelo = 'Bugatti', capacidade = 50, tipo = 'import', class = "vip"  },
--	{ hash = 547134075, name = 'mclarenp1', price = 1900000, banido = false, modelo = 'McLaren P1', capacidade = 50, tipo = 'exclusive', class = "vip"  },
	{ hash = -988501280, name = 'cheburek', price = 170000, banido = false, modelo = 'Cheburek', capacidade = 50, tipo = 'carros'  },
	{ hash = 1115909093, name = 'hotring', price = 300000, banido = false, modelo = 'Hotring', capacidade = 60, tipo = 'carros'  },
	{ hash = -214906006, name = 'jester3', price = 345000, banido = false, modelo = 'Jester3', capacidade = 50, tipo = 'carros'  },
	{ hash = -1259134696, name = 'flashgt', price = 370000, banido = false, modelo = 'Flashgt', capacidade = 50, tipo = 'carros'  },
	{ hash = -1267543371, name = 'ellie', price = 100000, banido = false, modelo = 'Ellie', capacidade = 50, tipo = 'carros'  },
	{ hash = 1603211447, name = 'eclipse', price = 1000000, banido = false, modelo = 'Mitsubishi Eclipse', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 1924372706, name = 'fusca', price = 18000, banido = false, modelo = 'Fusca', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 1046206681, name = 'michelli', price = 160000, banido = false, modelo = 'Michelli', capacidade = 40, tipo = 'carros'  },
	{ hash = 1617472902, name = 'fagaloa', price = 320000, banido = false, modelo = 'Fagaloa', capacidade = 80, tipo = 'carros'  },
	{ hash = -915704871, name = 'dominator2', price = 230000, banido = false, modelo = 'Dominator2', capacidade = 0, tipo = 'carros'  },
	{ hash = -986944621, name = 'dominator3', price = 105000, banido = false, modelo = 'Dominator3', capacidade = 50, tipo = 'carros'  },
	{ hash = 931280609, name = 'issi3', price = 190000, banido = false, modelo = 'Issi3', capacidade = 20, tipo = 'carros'  },
	{ hash = -1134706562, name = 'taipan', price = 620000, banido = false, modelo = 'Taipan', capacidade = 50, tipo = 'carros'  },
	{ hash = 1909189272, name = 'gb200', price = 195000, banido = false, modelo = 'Gb200', capacidade = 50, tipo = 'carros'  },
	{ hash = -1961627517, name = 'stretch', price = 2500000, banido = false, modelo = 'Stretch', capacidade = 60, tipo = 'carros'  },
	{ hash = -2107990196, name = 'guardian', price = 585000, banido = false, modelo = 'Guardian', capacidade = 150, tipo = 'carros'  },
	{ hash = -121446169, name = 'kamacho', price = 460000, banido = false, modelo = 'Kamacho', capacidade = 70, tipo = 'carros'  },
	{ hash = -1848994066, name = 'neon', price = 570000, banido = false, modelo = 'Neon', capacidade = 50, tipo = 'carros'  },
	{ hash = 1392481335, name = 'cyclone', price = 920000, banido = false, modelo = 'Cyclone', capacidade = 50, tipo = 'carros'  },
	{ hash = -2048333973, name = 'italigtb', price = 600000, banido = false, modelo = 'Italigtb', capacidade = 50, tipo = 'carros'  },
	{ hash = -482719877, name = 'italigtb2', price = 610000, banido = false, modelo = 'Italigtb2', capacidade = 50, tipo = 'carros'  },
	{ hash = 1939284556, name = 'vagner', price = 680000, banido = false, modelo = 'Vagner', capacidade = 50, tipo = 'carros'  },
	{ hash = 917809321, name = 'xa21', price = 630000, banido = false, modelo = 'Xa21', capacidade = 70, tipo = 'carros'  },
	{ hash = 1031562256, name = 'tezeract', price = 920000, banido = false, modelo = 'Tezeract', capacidade = 50, tipo = 'carros'  },
	{ hash = 2123327359, name = 'prototipo', price = 1030000, banido = false, modelo = 'Prototipo', capacidade = 50, tipo = 'carros'  },
	{ hash = -420911112, name = 'patriot2', price = 550000, banido = false, modelo = 'Patriot2', capacidade = 50, tipo = 'carros'  },
	{ hash = 321186144, name = 'stafford', price = 200000, banido = false, modelo = 'Stafford', capacidade = 40, tipo = 'work'  },
	{ hash = 500482303, name = 'swinger', price = 250000, banido = false, modelo = 'Swinger', capacidade = 50, tipo = 'carros'  },
	{ hash = -1566607184, name = 'clique', price = 360000, banido = false, modelo = 'Clique', capacidade = 40, tipo = 'carros'  },
	{ hash = 1591739866, name = 'deveste', price = 920000, banido = false, modelo = 'Deveste', capacidade = 50, tipo = 'carros'  },
	{ hash = 1279262537, name = 'deviant', price = 370000, banido = false, modelo = 'Deviant', capacidade = 50, tipo = 'carros'  },
	{ hash = -2096690334, name = 'impaler', price = 170000, banido = false, modelo = 'Impaler', capacidade = 50, tipo = 'carros'  },
	{ hash = -331467772, name = 'italigto', price = 485000, banido = false, modelo = 'Italigto', capacidade = 50, tipo = 'carros'  },
	{ hash = -507495760, name = 'schlagen', price = 690000, banido = false, modelo = 'Schlagen', capacidade = 50, tipo = 'carros'  },
	{ hash = -1168952148, name = 'toros', price = 210000, banido = false, modelo = 'Toros', capacidade = 50, tipo = 'carros'  },
	{ hash = 1456744817, name = 'tulip', price = 114000, banido = false, modelo = 'Tulip', capacidade = 60, tipo = 'carros'  },
	--{ hash = -1987109409, name = '150', price = 6000, banido = false, modelo = 'Honda 150', capacidade = 30, tipo = 'motos'  },
	{ hash = 493030188, name = 'amarok', price = 350000, banido = false, modelo = 'VW Amarok', capacidade = 80, tipo = 'brasil', class = "br"  },
--	{ hash = 2015170161, name = 'biz25', price = 3000, banido = false, modelo = 'Biz', capacidade = 30, tipo = 'motos', class = "br"  },
	{ hash = -486920242, name = 'dm1200', price = 600000, banido = false, modelo = 'Ducati 1200', capacidade = 30, tipo = 'motos'  },
	{ hash = -1883002148, name = 'emperor2', price = 50000, banido = false, modelo = 'Emperor 2', capacidade = 50, tipo = 'carros'  },
	{ hash = 1698933548, name = 'golg7', price = 17000, banido = false, modelo = 'Gol G7', capacidade = 50, tipo = 'brasil'  },
	{ hash = -1761239425, name = 'hornet', price = 500000, banido = false, modelo = 'Hornet', capacidade = 30, tipo = 'motos', class = "vip"  },
--	{ hash = -1707353429, name = 'monza', price = 500000, banido = false, modelo = 'Ferrari Monza', capacidade = 40, tipo = 'exclusive'  },
	--{ hash = 991407206, name = 'r1250', price = 450000, banido = false, modelo = 'BMW R1250', capacidade = 15, tipo = 'motos'  },
	{ hash = 1876694905, name = 'veloster', price = 70000, banido = false, modelo = 'Veloster', capacidade = 50, tipo = 'brasil'  },
	{ hash = -14519558, name = 'xj', price = 600000, banido = false, modelo = 'XJ', capacidade = 30, tipo = 'motos'  },
	{ hash = 1826651862, name = 'xt66', price = 250000, banido = false, modelo = 'XT66', capacidade = 30, tipo = 'motos'  },
	{ hash = 1744543800, name = 'z1000', price = 200000, banido = false, modelo = 'Z1000', capacidade = 20, tipo = 'motos'  },
	{ hash = 46103174, name = 'brasilia', price = 25000, banido = false, modelo = 'Brasilia', capacidade = 30, tipo = 'brasil'  },
	{ hash = -1444047101, name = 'bugatti', price = 1900000, banido = false, modelo = 'Bugatti', capacidade = 50, tipo = 'import', class = "vip"  },
	{ hash = -1721911377, name = 'clio', price = 40000, banido = false, modelo = 'Clio', capacidade = 50, tipo = 'brasil'  },
	{ hash = 1833236016, name = 'corvette', price = 1900000, banido = false, modelo = 'Corvette', capacidade = 30, tipo = 'exclusive', class = "vip"  },
	{ hash = -193064196, name = 'escort', price = 45000, banido = false, modelo = 'Escort', capacidade = 50, tipo = 'brasil'  },
	{ hash = 1663453404, name = 'evoque', price = 1000000, banido = false, modelo = 'Ranger Rover Evoque', capacidade = 50, tipo = 'exclusive'  },
	{ hash = -2007010518, name = 'fiesta', price = 35000, banido = false, modelo = 'New Fiesta', capacidade = 50, tipo = 'brasil'  },
	{ hash = -252643265, name = 'ftoro', price = 120000, banido = false, modelo = 'Fiat Toro', capacidade = 50, tipo = 'brasil'  },
	{ hash = 1518533038, name = 'hauler', price = 750000, banido = false, modelo = 'Caminhão', capacidade = 0, tipo = 'work'  },
	{ hash = 387748548, name = 'hauler2', price = 750000, banido = false, modelo = 'Caminhão', capacidade = 0, tipo = 'work'  },
	--{ hash = 547134075, name = 'mclarenp1', price = 1900000, banido = false, modelo = 'McLaren P1', capacidade = 50, tipo = 'exclusive'  },
	{ hash = -1120398581, name = 'omega', price = 30000, banido = false, modelo = 'Omega', capacidade = 50, tipo = 'brasil'  },
	{ hash = 648352964, name = 'parati2007', price = 33000, banido = false, modelo = 'Parati 2007', capacidade = 50, tipo = 'brasil'  },
	{ hash = -1281076242, name = 'peugeot207', price = 60000, banido = false, modelo = 'Peugeot 207', capacidade = 50, tipo = 'brasil'  },
	{ hash = -2137348917, name = 'phantom', price = 800000, banido = false, modelo = 'Caminhão', capacidade = 0, tipo = 'work'  },
	{ hash = 1125130375, name = 'polo', price = 25000, banido = false, modelo = 'Polo', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 515734555, name = 'astra', price = 80000, banido = false, modelo = 'Astra', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -1456558572, name = 'chevette', price = 30000, banido = false, modelo = 'Chevette', capacidade = 30, tipo = 'brasil', class = "br"  },
	{ hash = -380340310, name = 'corsa98', price = 50000, banido = false, modelo = 'Corsa 98', capacidade = 30, tipo = 'brasil', class = "br"  },
	{ hash = -997601910, name = 'cronos', price = 57000, banido = false, modelo = 'Fiat Cronos', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 1924372706, name = 'fusca', price = 18000, banido = false, modelo = 'Fusca', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 1698933548, name = 'golg7', price = 17000, banido = false, modelo = 'Gol G7', capacidade = 50, tipo = 'brasil'  },
	{ hash = 1547680982, name = 'hilux2016', price = 300000, banido = false, modelo = 'Hilux 2016', capacidade = 200, tipo = 'brasil', class = "br"  },
	{ hash = 701696699, name = 'jetta', price = 80000, banido = false, modelo = 'Jetta', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -1961924436, name = 'palio97', price = 10000, banido = false, modelo = 'Palio 97', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -1773424714, name = 'passat', price = 90000, banido = false, modelo = 'Passat', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -110704625, name = 's10', price = 450000, banido = false, modelo = 'S10', capacidade = 100, tipo = 'brasil', class = "br"  },
	{ hash = -1718750914, name = 'saveirog6', price = 30000, banido = false, modelo = 'Saveiro G6', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = -419705714, name = 'tritonhpe', price = 250000, banido = false, modelo = 'Triton', capacidade = 100, tipo = 'brasil', class = "br"  },
	{ hash = 1062355240, name = 'uno', price = 25000, banido = false, modelo = 'Uno', capacidade = 50, tipo = 'brasil', class = "br"  },
	{ hash = 519002268, name = 'versa', price = 40000, banido = false, modelo = 'Nissan Versa', capacidade = 50, tipo = 'brasil', class = "br"  },

	{ hash = -1304790695, name = 'f150', price = 1000000, banido = false, modelo = 'Ford F150', capacidade = 150, tipo = 'brasil', class = "br"  },
--	{ hash = 991407206, name = 'r1250', price = 450000, banido = false, modelo = 'BMW R1250', capacidade = 15, tipo = 'motos'  },
	{ hash = 1876694905, name = 'veloster', price = 70000, banido = false, modelo = 'Veloster', capacidade = 50, tipo = 'brasil'  },
	{ hash = -14519558, name = 'xj', price = 60000, banido = false, modelo = 'XJ', capacidade = 30, tipo = 'motos'  },
	{ hash = 1826651862, name = 'xt66', price = 7500, banido = false, modelo = 'XT66', capacidade = 30, tipo = 'motos'  },
	--{ hash = 1744543800, name = 'z1000', price = 200000, banido = false, modelo = 'Z1000', capacidade = 20, tipo = 'motos'  },
--	{ hash = 723779872, name = 'toyotasupra', price = 190000, banido = false, modelo = 'Toyota Supra', capacidade = 50, tipo = 'import'  },
	--{ hash = 723779872, name = 'toyotasupra', price = 190000, banido = false, modelo = 'Toyota Supra', capacidade = 50, tipo = 'import'  },
	{ hash = -311022263, name = 'seashark3', price = 1000, banido = false, modelo = 'Seashark3', capacidade = 0, tipo = 'work'  },
	--{ hash = -1987109409, name = '150', price = 6000, banido = false, modelo = 'Honda 150', capacidade = 30, tipo = 'motos'  },
	{ hash = 2015170161, name = 'biz25', price = 3000, banido = false, modelo = 'Biz', capacidade = 30, tipo = 'motos'  },
	{ hash = 1124490263, name = 'bros60', price = 7500, banido = false, modelo = 'Bros 160', capacidade = 30, tipo = 'motos'  },
	{ hash = -486920242, name = 'dm1200', price = 150000, banido = false, modelo = 'Ducati 1200', capacidade = 30, tipo = 'motos'  },
	{ hash = -1883002148, name = 'emperor2', price = 50000, banido = false, modelo = 'Emperor 2', capacidade = 50, tipo = 'carros'  },
	{ hash = 1698933548, name = 'golg7', price = 17000, banido = false, modelo = 'Gol G7', capacidade = 50, tipo = 'brasil'  },
	{ hash = -1761239425, name = 'hornet', price = 50000, banido = false, modelo = 'Hornet', capacidade = 30, tipo = 'motos'  },
	{ hash = 1876694905, name = 'veloster', price = 70000, banido = false, modelo = 'Veloster', capacidade = 50, tipo = 'brasil'  },
	{ hash = -14519558, name = 'xj', price = 60000, banido = false, modelo = 'XJ', capacidade = 30, tipo = 'motos'  },
	{ hash = 1826651862, name = 'xt66', price = 7500, banido = false, modelo = 'XT66', capacidade = 30, tipo = 'motos'  },
--	{ hash = 1744543800, name = 'z1000', price = 200000, banido = false, modelo = 'Z1000', capacidade = 20, tipo = 'motos'  },
	{ hash = -49115651, name = 'vamos', price = 110000, banido = false, modelo = 'Vamos', capacidade = 60, tipo = 'carros'  },
	{ hash = -54332285, name = 'freecrawler', price = 300000, banido = false, modelo = 'Freecrawler', capacidade = 50, tipo = 'carros'  },
	{ hash = 1909141499, name = 'fugitive', price = 50000, banido = false, modelo = 'Fugitive', capacidade = 0, tipo = 'carros'  },
	{ hash = -1232836011, name = 'le7b', price = 700000, banido = false, modelo = 'Le7b', capacidade = 0, tipo = 'carros'  },
	{ hash = 2068293287, name = 'lurcher', price = 150000, banido = false, modelo = 'Lurcher', capacidade = 0, tipo = 'carros'  },
	{ hash = 482197771, name = 'lynx', price = 370000, banido = false, modelo = 'Lynx', capacidade = 50, tipo = 'carros'  },
	{ hash = -674927303, name = 'raptor', price = 300000, banido = false, modelo = 'Raptor', capacidade = 50, tipo = 'carros'  },
	{ hash = 819197656, name = 'sheava', price = 700000, banido = false, modelo = 'Sheava', capacidade = 60, tipo = 'carros'  },
	{ hash = 838982985, name = 'z190', price = 350000, banido = false, modelo = 'Z190', capacidade = 50, tipo = 'carros'  },
	{ hash = 1672195559, name = 'akuma', price = 350000, banido = false, modelo = 'Akuma', capacidade = 30, tipo = 'motos'  },
	{ hash = -2115793025, name = 'avarus', price = 123000, banido = false, modelo = 'Avarus', capacidade = 30, tipo = 'motos'  },
	{ hash = -2140431165, name = 'bagger', price = 300000, banido = false, modelo = 'Bagger', capacidade = 30, tipo = 'motos'  },
	{ hash = -114291515, name = 'bati', price = 370000, banido = false, modelo = 'Bati', capacidade = 30, tipo = 'motos'  },
	{ hash = -891462355, name = 'bati2', price = 300000, banido = false, modelo = 'Bati2', capacidade = 0, tipo = 'motos'  },
	{ hash = 86520421, name = 'bf400', price = 105000, banido = false, modelo = 'Bf400', capacidade = 30, tipo = 'motos'  },
	{ hash = 11251904, name = 'carbonrs', price = 370000, banido = false, modelo = 'Carbonrs', capacidade = 30, tipo = 'motos'  },
	{ hash = 2053223216, name = 'benson', price = 1000000, banido = false, modelo = 'Benson', capacidade = 400, tipo = 'caminhoes'  },
	{ hash = -2052737935, name = 'mule3', price = 850000, banido = false, modelo = 'Mule 3', capacidade = 300, tipo = 'caminhoes'  },
	{ hash = -2103821244, name = 'rallytruck', price = 260000, banido = false, modelo = 'rallytruck', capacidade = 1500, tipo = 'carros', class = "vip"  },
	{ hash = 2112052861, name = 'pounder', price = 1300000, banido = false, modelo = 'Pounder', capacidade = 520, tipo = 'caminhoes'  },
	{ hash = -1156537658, name = 'tiger', price = 2200000, banido = false, modelo = 'TIGER 800', capacidade = 150, tipo = 'exclusive', class = "vip"  },
	{ hash = 819197656, name = 'sheava', price = 700000, banido = false, modelo = 'Sheava', capacidade = 60, tipo = 'carros'  },
	{ hash = 223240013, name = 'cheetah2', price = 240000, banido = false, modelo = 'Cheetah2', capacidade = 50, tipo = 'carros'  },
	{ hash = -195053128, name = 'blazer11', price = 1000, banido = false, modelo = 'BLAZER - FT', capacidade = 30, tipo = 'work'  },
	{ hash = -403808748, name = 'xre2019', price = 1000, banido = false, modelo = 'xre2019', capacidade = 150, tipo = 'work'  },
	{ hash = 323426592, name = 'trailcfp', price = 1000, banido = false, modelo = 'TRAIL - PMESP', capacidade = 150, tipo = 'work'  },
	{ hash = 310250959, name = 'sw4revrota1', price = 1000, banido = false, modelo = 'SW4 - ROTA', capacidade = 0, tipo = 'work'  },
	{ hash = -1254333804, name = 'trailrota2', price = 1000, banido = false, modelo = 'trailrota2', capacidade = 0, tipo = 'work'  },
	{ hash = -1801352356, name = 'trailbaep', price = 1000, banido = false, modelo = 'trail - baep', capacidade = 150, tipo = 'work'  },
	{ hash = 1171614426, name = 'ambulance', price = 1000, banido = false, modelo = 'Ambulância', capacidade = 0, tipo = 'work'  },
	{ hash = -1569874267, name = 'tigerrocam', price = 1000, banido = false, modelo = 'tigerrocam - PMESP', capacidade = 150, tipo = 'work'  },
	{ hash = 14375996599, name = 'voyagepmerj', price = 1000, banido = false, modelo = 'Voyage', capacidade = 50, tipo = 'work'  },
	{ hash = -2072933068, name = 'coach', price = 1000, banido = false, modelo = 'Ônibus', capacidade = 0, tipo = 'work'  },
	{ hash = 592469868, name = 's10pmerj', price = 1000, banido = false, modelo = 'S10', capacidade = 150, tipo = 'work'  },
	{ hash = 1016204281, name = 'dusterpc', price = 1000, banido = false, modelo = 'Duster', capacidade = 50, tipo = 'work'  },
	{ hash = -701653192, name = 'trailcivileie', price = 1000, banido = false, modelo = 'trailcivileie', capacidade = 0, tipo = 'work'  },
	{ hash = 882175746, name = 'cruzeprf2', price = 1000, banido = false, modelo = 'CRUZER - PRF', capacidade = 120, tipo = 'work'  },
	{ hash = 137952352, name = 'sw4', price = 1000, banido = false, modelo = 'sw4 - FT', capacidade = 150, tipo = 'work'  },
	{ hash = -1106997245, name = 'Spin2', price = 1000, banido = false, modelo = 'spin - PMESP', capacidade = 150, tipo = 'work'  },
	{ hash = -1608541323, name = 'Palio2018', price = 1000, banido = false, modelo = 'Palio - PMESP', capacidade = 150, tipo = 'work'  },
	{ hash = 1396759790, name = 'spacerp', price = 1000, banido = false, modelo = 'SPACE - PMESP', capacidade = 150, tipo = 'work'  },
	--{ hash = 991407206, name = 'r1250', price = 450000, banido = false, modelo = 'BMW R1250', capacidade = 15, tipo = 'motos'  },
	{ hash = -1988428699, name = 'terbyte', price = 1500000, banido = false, modelo = 'Terbyte', capacidade = 500, tipo = 'caminhoes'  },
	{ hash = 6774487, name = 'chimera', price = 345000, banido = false, modelo = 'Chimera', capacidade = 30, tipo = 'motos'  },
	{ hash = 390201602, name = 'cliffhanger', price = 390000, banido = false, modelo = 'Cliffhanger', capacidade = 30, tipo = 'motos'  },
	{ hash = 2006142190, name = 'daemon', price = 200000, banido = false, modelo = 'Daemon', capacidade = 30, tipo = 'work'  },
	{ hash = -1404136503, name = 'daemon2', price = 105000, banido = false, modelo = 'Daemon2', capacidade = 30, tipo = 'motos'  },
	{ hash = 822018448, name = 'defiler', price = 460000, banido = false, modelo = 'Defiler', capacidade = 30, tipo = 'motos'  },
	{ hash = -239841468, name = 'diablous', price = 205000, banido = false, modelo = 'Diablous', capacidade = 30, tipo = 'motos'  },
	{ hash = 1790834270, name = 'diablous2', price = 460000, banido = false, modelo = 'Diablous2', capacidade = 30, tipo = 'motos'  },
	{ hash = -1670998136, name = 'double', price = 123000, banido = false, modelo = 'Double', capacidade = 30, tipo = 'motos'  },
	{ hash = 1753414259, name = 'enduro', price = 30000, banido = false, modelo = 'Enduro', capacidade = 30, tipo = 'motos'  },
	{ hash = 2035069708, name = 'esskey', price = 30000, banido = false, modelo = 'Esskey', capacidade = 30, tipo = 'motos'  },
	{ hash = -1842748181, name = 'faggio', price = 3000, banido = false, modelo = 'Faggio', capacidade = 30, tipo = 'motos'  },
	{ hash = 55628203, name = 'faggio2', price = 5000, banido = false, modelo = 'Faggio2', capacidade = 30, tipo = 'motos'  },
	{ hash = -1289178744, name = 'faggio3', price = 5000, banido = false, modelo = 'Faggio3', capacidade = 30, tipo = 'motos'  },
	{ hash = 735175855, name = 'cbrr', price = 100000, banido = false, modelo = 'CBR 1000RR', capacidade = 20, tipo = 'motos', class = "vip"  },
	{ hash = 1474015055, name = 'r1', price = 60000, banido = false, modelo = 'Yamaha R1', capacidade = 70, tipo = 'motos', class = "vip"  },
	{ hash = 321407703, name = 'CBTWISTER', price = 60000, banido = false, modelo = 'CBTWISTER', capacidade = 70, tipo = 'motos', class = "br"  },
	{ hash = -1987109409, name = '150', price = 6000, banido = false, modelo = 'Honda 150', capacidade = 30, tipo = 'motos', class = "br"  },

	{ hash = 796090932, name = 'cg1602', price = 6000, banido = false, modelo = 'CG-160', capacidade = 30, tipo = 'motos', class = "br"  },
	--{ hash = 1744543800, name = 'z1000', price = 200000, banido = false, modelo = 'Z1000', capacidade = 20, tipo = 'motos'  },
	{ hash = 1826651862, name = 'xt66', price = 7500, banido = false, modelo = 'XT66', capacidade = 30, tipo = 'motos'  },
	{ hash = -14519558, name = 'xj', price = 60000, banido = false, modelo = 'XJ', capacidade = 30, tipo = 'motos'  },
	{ hash = -1761239425, name = 'hornet', price = 50000, banido = false, modelo = 'Hornet', capacidade = 30, tipo = 'motos'  },
	{ hash = 1124490263, name = 'bros60', price = 7500, banido = false, modelo = 'Bros 160', capacidade = 30, tipo = 'motos'  },
	{ hash = -486920242, name = 'dm1200', price = 150000, banido = false, modelo = 'Ducati 1200', capacidade = 30, tipo = 'motos'  },
	{ hash = -1265899455, name = 'hcbr17', price = 1000000, banido = false, modelo = 'Honda CBR17', capacidade = 100, tipo = 'exclusive', class = "vip"  },
	{ hash = -1667727259, name = 'nh2r', price = 2200000, banido = false, modelo = 'Ninja H2R', capacidade = 100, tipo = 'exclusive', class = "vip"  },
	{ hash = 1474015055, name = 'r1', price = 60000, banido = false, modelo = 'Yamaha R1', capacidade = 70, tipo = 'motos', class = "vip", class = "vip"  },
	{ hash = -188978926, name = 'r6', price = 95000, banido = false, modelo = 'Yamaha R6', capacidade = 20, tipo = 'motos', class = "vip", class = "vip"  },
	{ hash = -2049243343, name = 'rc', price = 1000000, banido = false, modelo = 'KTM RC', capacidade = 60, tipo = 'exclusive', class = "vip", class = "vip"  },
	{ hash = 627535535, name = 'fcr', price = 390000, banido = false, modelo = 'Fcr', capacidade = 30, tipo = 'motos'  },
	{ hash = -757735410, name = 'fcr2', price = 390000, banido = false, modelo = 'Fcr2', capacidade = 30, tipo = 'motos'  },
	{ hash = 741090084, name = 'gargoyle', price = 345000, banido = false, modelo = 'Gargoyle', capacidade = 30, tipo = 'motos'  },
	{ hash = 1265391242, name = 'hakuchou', price = 380000, banido = false, modelo = 'Hakuchou', capacidade = 30, tipo = 'motos'  },
	{ hash = -255678177, name = 'hakuchou2', price = 483000, banido = false, modelo = 'Hakuchou2', capacidade = 30, tipo = 'motos'  },
	{ hash = 301427732, name = 'hexer', price = 250000, banido = false, modelo = 'Hexer', capacidade = 30, tipo = 'motos'  },
	{ hash = -159126838, name = 'innovation', price = 250000, banido = false, modelo = 'Innovation', capacidade = 30, tipo = 'motos'  },
	{ hash = 640818791, name = 'lectro', price = 380000, banido = false, modelo = 'Lectro', capacidade = 30, tipo = 'motos'  },
	{ hash = -1523428744, name = 'manchez', price = 355000, banido = false, modelo = 'Manchez', capacidade = 30, tipo = 'motos'  },
	{ hash = -634879114, name = 'nemesis', price = 345000, banido = false, modelo = 'Nemesis', capacidade = 30, tipo = 'motos'  },
	{ hash = -1606187161, name = 'nightblade', price = 260000, banido = false, modelo = 'Nightblade', capacidade = 30, tipo = 'motos'  },
	{ hash = -909201658, name = 'pcj', price = 17000, banido = false, modelo = 'Pcj', capacidade = 30, tipo = 'motos'  },
	{ hash = -893578776, name = 'ruffian', price = 345000, banido = false, modelo = 'Ruffian', capacidade = 30, tipo = 'motos'  },
	{ hash = 788045382, name = 'sanchez', price = 185000, banido = false, modelo = 'Sanchez', capacidade = 30, tipo = 'motos'  },
	{ hash = -1453280962, name = 'sanchez2', price = 97000, banido = false, modelo = 'Sanchez2', capacidade = 30, tipo = 'motos'  },
	{ hash = 1491277511, name = 'sanctus', price = 200000, banido = false, modelo = 'Sanctus', capacidade = 30, tipo = 'work'  },
	{ hash = 743478836, name = 'sovereign', price = 285000, banido = false, modelo = 'Sovereign', capacidade = 80, tipo = 'motos'  },
	{ hash = 1836027715, name = 'thrust', price = 375000, banido = false, modelo = 'Thrust', capacidade = 30, tipo = 'motos'  },
	{ hash = -140902153, name = 'vader', price = 140000, banido = false, modelo = 'Vader', capacidade = 30, tipo = 'motos'  },
	{ hash = -1353081087, name = 'vindicator', price = 340000, banido = false, modelo = 'Vindicator', capacidade = 30, tipo = 'motos'  },
	{ hash = -609625092, name = 'vortex', price = 98200, banido = false, modelo = 'Vortex', capacidade = 30, tipo = 'motos'  },
	{ hash = -618617997, name = 'wolfsbane', price = 290000, banido = false, modelo = 'Wolfsbane', capacidade = 30, tipo = 'motos'  },
	{ hash = -1009268949, name = 'zombiea', price = 290000, banido = false, modelo = 'Zombiea', capacidade = 30, tipo = 'motos'  },
	{ hash = -570033273, name = 'zombieb', price = 300000, banido = false, modelo = 'Zombieb', capacidade = 30, tipo = 'motos'  },
	{ hash = -2128233223, name = 'blazer', price = 230000, banido = true, modelo = 'Blazer', capacidade = 30, tipo = 'motos'  },
	{ hash = -440768424, name = 'blazer4', price = 370000, banido = true, modelo = 'Blazer4', capacidade = 30, tipo = 'motos'  },
	{ hash = -405626514, name = 'shotaro', price = 500000, banido = false, modelo = 'Shotaro', capacidade = 30, tipo = 'motos'  },
	{ hash = 1873600305, name = 'ratbike', price = 230000, banido = false, modelo = 'Ratbike', capacidade = 30, tipo = 'motos'  },
	{ hash = 796154746, name = 'policiamustanggt', price = 1000, banido = true, modelo = 'Mustang GT', capacidade = 0, tipo = 'work'  },
	{ hash = 81717913, name = 'policiacapricesid', price = 1000, banido = true, modelo = 'GM Caprice SID', capacidade = 0, tipo = 'work'  },
	{ hash = 589099944, name = 'policiaschaftersid', price = 1000, banido = true, modelo = 'GM Schafter SID', capacidade = 0, tipo = 'work'  },
	{ hash = -377693317, name = 'policiaexplorer', price = 1000, banido = true, modelo = 'Ford Explorer', capacidade = 0, tipo = 'work'  },
	{ hash = -875050963, name = 'policiaheli', price = 1000, banido = true, modelo = 'Helicóptero', capacidade = 0, tipo = 'work'  },
	{ hash = -1647941228, name = 'fbi2', price = 1000, banido = true, modelo = 'Granger SOG', capacidade = 0, tipo = 'work'  },
	{ hash = -34623805, name = 'policeb', price = 1000, banido = true, modelo = 'Moto', capacidade = 60, tipo = 'work'  },
	{ hash = -792745162, name = 'paramedicoambu', price = 1000, banido = true, modelo = 'Ambulância', capacidade = 0, tipo = 'work'  },
	{ hash = 108063727, name = 'paramedicocharger2014', price = 1000, banido = true, modelo = 'Dodge Charger 2014', capacidade = 0, tipo = 'work'  },
	{ hash = 2020690903, name = 'paramedicoheli', price = 1000, banido = true, modelo = 'Helicóptero', capacidade = 0, tipo = 'work'  },
	{ hash = -2007026063, name = 'pbus', price = 1000, banido = true, modelo = 'PBus', capacidade = 0, tipo = 'work'  },
	{ hash = 1945374990, name = 'mule4', price = 260000, banido = false, modelo = 'Burrito4', capacidade = 400, tipo = 'carros'  },
	{ hash = -2103821244, name = 'rallytruck', price = 260000, banido = false, modelo = 'Burrito4', capacidade = 1500, tipo = 'carros'  },
	{ hash = -1205689942, name = 'riot', price = 1000, banido = true, modelo = 'Blindado', capacidade = 0, tipo = 'work'  },
	{ hash = -713569950, name = 'bus', price = 1000, banido = true, modelo = 'Bus', capacidade = 0, tipo = 'work'  },
	{ hash = 1353720154, name = 'flatbed', price = 1000, banido = true, modelo = 'Reboque Prancha', capacidade = 0, tipo = 'work'  },
	{ hash = -1323100960, name = 'towtruck', price = 1000, banido = true, modelo = 'Reboque Guincho', capacidade = 0, tipo = 'work'  },
	{ hash = -442313018, name = 'towtruck2', price = 1000, banido = true, modelo = 'Towtruck2', capacidade = 0, tipo = 'work'  },
	{ hash = -667151410, name = 'ratloader', price = 1000, banido = true, modelo = 'Caminhão', capacidade = 0, tipo = 'work'  },
	{ hash = -589178377, name = 'ratloader2', price = 1000, banido = false, modelo = 'Ratloader2', capacidade = 70, tipo = 'work'  },
	{ hash = -1705304628, name = 'rubble', price = 1000, banido = true, modelo = 'Caminhão', capacidade = 0, tipo = 'work'  },
	{ hash = 444171386, name = 'boxville4', price = 1000, banido = false, modelo = 'Caminhão', capacidade = 0, tipo = 'work'  },
	{ hash = -233098306, name = 'boxville2', price = 1000, banido = false, modelo = 'Caminhão', capacidade = 40, tipo = 'work'  },
	{ hash = -1255698084, name = 'trash2', price = 1000, banido = false, modelo = 'Caminhão', capacidade = 0, tipo = 'work'  },
	{ hash = 48339065, name = 'tiptruck', price = 1000, banido = false, modelo = 'Tiptruck', capacidade = 0, tipo = 'work'  },
	{ hash = -186537451, name = 'scorcher', price = 1000, banido = true, modelo = 'Scorcher', capacidade = 0, tipo = 'work'  },
	{ hash = 1127861609, name = 'tribike', price = 1000, banido = true, modelo = 'Tribike', capacidade = 0, tipo = 'work'  },
	{ hash = -1233807380, name = 'tribike2', price = 1000, banido = true, modelo = 'Tribike2', capacidade = 0, tipo = 'work'  },
	{ hash = -400295096, name = 'tribike3', price = 1000, banido = true, modelo = 'Tribike3', capacidade = 0, tipo = 'work'  },
	{ hash = -836512833, name = 'fixter', price = 1000, banido = true, modelo = 'Fixter', capacidade = 0, tipo = 'work'  },
	{ hash = 448402357, name = 'cruiser', price = 1000, banido = true, modelo = 'Cruiser', capacidade = 0, tipo = 'work'  },
	{ hash = 1131912276, name = 'bmx', price = 1000, banido = true, modelo = 'Bmx', capacidade = 0, tipo = 'work'  },
	{ hash = 1033245328, name = 'dinghy', price = 1000, banido = true, modelo = 'Dinghy', capacidade = 0, tipo = 'work'  },
	{ hash = 861409633, name = 'jetmax', price = 1000, banido = true, modelo = 'Jetmax', capacidade = 0, tipo = 'work'  },
	{ hash = -1043459709, name = 'marquis', price = 1000, banido = true, modelo = 'Marquis', capacidade = 0, tipo = 'work'  },
	{ hash = -311022263, name = 'seashark3', price = 1000, banido = true, modelo = 'Seashark3', capacidade = 0, tipo = 'work'  },
	{ hash = 231083307, name = 'speeder', price = 1000, banido = true, modelo = 'Speeder', capacidade = 0, tipo = 'work'  },
	{ hash = 437538602, name = 'speeder2', price = 1000, banido = true, modelo = 'Speeder2', capacidade = 0, tipo = 'work'  },
	{ hash = -130814154, name = 'surfboard', price = 2000, banido = true, modelo = 'Prancha de Surf', capacidade = 0, tipo = 'work'  },
	{ hash = 400514754, name = 'squalo', price = 1000, banido = true, modelo = 'Squalo', capacidade = 0, tipo = 'work'  },
	{ hash = -282946103, name = 'suntrap', price = 1000, banido = true, modelo = 'Suntrap', capacidade = 0, tipo = 'work'  },
	{ hash = 1070967343, name = 'toro', price = 1000, banido = true, modelo = 'Toro', capacidade = 0, tipo = 'work'  },
	{ hash = 908897389, name = 'toro2', price = 1000, banido = true, modelo = 'Toro2', capacidade = 0, tipo = 'work'  },
	{ hash = 290013743, name = 'tropic', price = 1000, banido = true, modelo = 'Tropic', capacidade = 0, tipo = 'work'  },
	{ hash = 1448677353, name = 'tropic2', price = 1000, banido = true, modelo = 'Tropic2', capacidade = 0, tipo = 'work'  },
	{ hash = -2137348917, name = 'phantom', price = 1000, banido = true, modelo = 'Caminhão', capacidade = 0, tipo = 'work'  },
	{ hash = 1518533038, name = 'hauler', price = 750000, banido = true, modelo = 'Caminhão', capacidade = 0, tipo = 'work'  },
	{ hash = 387748548, name = 'hauler2', price = 750000, banido = true, modelo = 'Caminhão', capacidade = 0, tipo = 'work'  },
	{ hash = 569305213, name = 'packer', price = 1000, banido = true, modelo = 'Packer', capacidade = 0, tipo = 'work'  },
	{ hash = 710198397, name = 'supervolito', price = 1000, banido = false, modelo = 'Supervolito', capacidade = 500, tipo = 'exclusive', class = "vip"  },
	{ hash = -1671539132, name = 'supervolito2', price = 1000, banido = false, modelo = 'Supervolito', capacidade = 350, tipo = 'exclusive', class = "vip"  },
	{ hash = -726768679, name = 'seasparrow', price = 1000, banido = true, modelo = 'Sea Sparrow', capacidade = 0, tipo = 'work'  },
	{ hash = -644710429, name = 'cuban800', price = 1000, banido = true, modelo = 'Cuban800', capacidade = 0, tipo = 'work'  },
	{ hash = -1746576111, name = 'mammatus', price = 1000, banido = true, modelo = 'Mammatus', capacidade = 0, tipo = 'work'  },
	{ hash = 1341619767, name = 'vestra', price = 1000, banido = true, modelo = 'Vestra', capacidade = 0, tipo = 'work'  },
	{ hash = 1077420264, name = 'velum2', price = 1000, banido = true, modelo = 'Velum2', capacidade = 0, tipo = 'work'  },
	{ hash = 745926877, name = 'buzzard2', price = 1000, banido = true, modelo = 'Buzzard', capacidade = 0, tipo = 'work'  },
	{ hash = 744705981, name = 'frogger', price = 1000, banido = true, modelo = 'Heli Weazel', capacidade = 0, tipo = 'work'  },
	{ hash = 1956216962, name = 'tanker2', price = 1000, banido = true, modelo = 'Gas', capacidade = 0, tipo = 'work'  },
	{ hash = -1207431159, name = 'armytanker', price = 1000, banido = true, modelo = 'Diesel', capacidade = 0, tipo = 'work'  },
	{ hash = -1770643266, name = 'tvtrailer', price = 1000, banido = true, modelo = 'Show', capacidade = 0, tipo = 'work'  },
	{ hash = 2016027501, name = 'trailerlogs', price = 1000, banido = true, modelo = 'Woods', capacidade = 0, tipo = 'work'  },
	{ hash = 2091594960, name = 'tr4', price = 1000, banido = true, modelo = 'Cars', capacidade = 0, tipo = 'work'  },
	{ hash = -1173768715, name = 'ferrariitalia', price = 3000000, banido = false, modelo = 'Ferrari Italia 478', capacidade = 20, tipo = 'exclusive', class = "vip"  },
	--{ hash = 1676738519, name = 'audirs6', price = 150000, banido = false, modelo = 'Audi RS6', capacidade = 50, tipo = 'import', class = "vip"  },
	{ hash = -13524981, name = 'bmwm4gts', price = 350000, banido = false, modelo = 'BMW M4 GTS', capacidade = 70, tipo = 'import', class = "vip"  },
	{ hash = -1573350092, name = 'fordmustang', price = 1000000, banido = false, modelo = 'Ford Mustang', capacidade = 70, tipo = 'import'  },
	{ hash = 1978088379, name = 'lancerevolutionx', price = 130000, banido = false, modelo = 'Lancer Evolution X', capacidade = 70, tipo = 'import', class = "vip"  },
	{ hash = 2034235290, name = 'mazdarx7', price = 150000, banido = false, modelo = 'Mazda RX7', capacidade = 70, tipo = 'import', class = "vip"  },
--	{ hash = -4816535, name = 'nissanskyliner34', price = 350000, banido = false, modelo = 'Nissan Skyline R34', capacidade = 70, tipo = 'import', class = "vip"  },
	{ hash = 819937652, name = 'focusrs', price = 100000, banido = false, modelo = 'Focus RS', capacidade = 0, tipo = 'import'  },
	{ hash = -133349447, name = 'lancerevolution9', price = 100000, banido = false, modelo = 'Lancer Evolution 9', capacidade = 0, tipo = 'import'  },
	{ hash = 1911052153, name = 'ninjah2', price = 1000000, banido = false, modelo = 'Ninja H2', capacidade = 0, tipo = 'exclusive', class = "vip"  },
	{ hash = -189438188, name = 'p1', price = 1000000, banido = false, modelo = 'Mclaren P1', capacidade = 0, tipo = 'exclusive', class = "vip"  },
	{ hash = -380714779, name = 'bme6tun', price = 1000000, banido = false, modelo = 'BMW M5', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -1481236684, name = 'aperta', price = 2500000, banido = false, modelo = 'La Ferrari', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -498891507, name = 'bettle', price = 1000000, banido = false, modelo = 'New Bettle', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 2045784380, name = 'rmodx6', price = 500000, banido = false, modelo = 'BMW X6', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 113372153, name = 'bnteam', price = 1000000, banido = false, modelo = 'Bentley', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -1274284606, name = 'rmodlp770', price = 1000000, banido = false, modelo = 'Lamborghini Centenario', capacidade = 0, tipo = 'exclusive', class = "vip"  },
	{ hash = 1503141430, name = 'divo', price = 1000000, banido = false, modelo = 'Buggati Divo', capacidade = 20, tipo = 'exclusive', class = "vip"  },
	{ hash = 1966489524, name = 's15', price = 1000000, banido = false, modelo = 'Nissan Silvia S15', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -915188472, name = 'amggtr', price = 1000000, banido = false, modelo = 'Mercedes AMG', capacidade = 50, tipo = 'exclusive', class = "vip"  },
	{ hash = -264618235, name = 'lamtmc', price = 1000000, banido = false, modelo = 'Lamborghini Terzo', capacidade = 0, tipo = 'exclusive', class = "vip"  },
	{ hash = -1067176722, name = 'vantage', price = 1000000, banido = false, modelo = 'Aston Martin Vantage', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -520214134, name = 'urus', price = 1000000, banido = false, modelo = 'Lamborghini Urus', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 493030188, name = 'amarok', price = 350000, banido = false, modelo = 'VW Amarok', capacidade = 80, tipo = 'brasil'  },
	{ hash = 2093958905, name = 'slsamg', price = 1000000, banido = false, modelo = 'Mercedes SLS', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 104532066, name = 'g65amg', price = 1000000, banido = false, modelo = 'Mercedes G65', capacidade = 100, tipo = 'exclusive', class = "vip"  },
	{ hash = 137494285, name = 'eleanor', price = 1000000, banido = false, modelo = 'Mustang Eleanor', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -863499820, name = 'rmodamgc63', price = 1000000, banido = false, modelo = 'Mercedes AMG C63', capacidade = 0, tipo = 'exclusive', class = "vip"  },
	{ hash = -1315334327, name = 'palameila', price = 1000000, banido = false, modelo = 'Porsche Panamera', capacidade = 0, tipo = 'exclusive', class = "vip"  },
	{ hash = -1031680535, name = 'rsvr16', price = 1400000, banido = false, modelo = 'Ranger Rover', capacidade = 0, tipo = 'exclusive', class = "vip"  },
	{ hash = -1824291874, name = '19ramdonk', price = 1000000, banido = false, modelo = 'Dodge Ram Donk', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -304124483, name = 'silv86', price = 1000000, banido = false, modelo = 'Silverado Donk', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -402398867, name = 'bc', price = 1000000, banido = false, modelo = 'Pagani Huayra', capacidade = 0, tipo = 'exclusive', class = "vip"  },
	{ hash = 2113322010, name = '70camarofn', price = 1000000, banido = false, modelo = 'camaro Z28 1970', capacidade = 0, tipo = 'exclusive', class = "vip"  },
	{ hash = -654239719, name = 'agerars', price = 1000000, banido = false, modelo = 'Koenigsegg Agera RS', capacidade = 0, tipo = 'exclusive', class = "vip"  },
	{ hash = 1402024844, name = 'bbentayga', price = 1000000, banido = false, modelo = 'Bentley Bentayga', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 1221510024, name = 'nissantitan17', price = 1000000, banido = false, modelo = 'Nissan Titan 2017', capacidade = 150, tipo = 'exclusive', class = "vip"  },
	{ hash = 1085789913, name = 'regera', price = 1000000, banido = false, modelo = 'Koenigsegg Regera', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 144259586, name = '911r', price = 1000000, banido = false, modelo = 'Porsche 911R', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 1047274985, name = 'africat', price = 1000000, banido = false, modelo = 'Honda CRF 1000', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -653358508, name = 'msohs', price = 1000000, banido = false, modelo = 'Mclaren 688 HS', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -2011325074, name = 'gt17', price = 1000000, banido = false, modelo = 'Ford GT 17', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 1224601968, name = '19ftype', price = 1000000, banido = false, modelo = 'Jaguar F-Type', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -1593808613, name = '488gtb', price = 1000000, banido = false, modelo = 'Ferrari 488 GTB', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 235772231, name = 'fxxkevo', price = 1000000, banido = false, modelo = 'Ferrari FXXK Evo', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -1313740730, name = 'm2', price = 1000000, banido = false, modelo = 'BMW M2', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 233681897, name = 'defiant', price = 1000000, banido = false, modelo = 'AMC Javelin 72', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -1507259850, name = 'f12tdf', price = 1000000, banido = false, modelo = 'Ferrari F12 TDF', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -1863430482, name = '71gtx', price = 1000000, banido = false, modelo = 'Plymouth 71 GTX', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 859592619, name = 'porsche992', price = 1000000, banido = false, modelo = 'Porsche 992', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 1215232069, name = 'p1gtr', price = 1000000, banido = false, modelo = 'MClarem P1', capacidade = 0, tipo = 'exclusive', class = "vip"  },
	{ hash = 1270688730, name = 'm6e63', price = 1000000, banido = false, modelo = 'BMW M6 E63', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -1467569396, name = '180sx', price = 1000000, banido = false, modelo = 'Nissan 180SX', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -192929549, name = 'audirs7', price = 100000, banido = false, modelo = 'Audi RS7', capacidade = 0, tipo = 'import', class = "vip"  },
	{ hash = -148915999, name = 'mustangmach1', price = 100000, banido = false, modelo = 'Mustang Mach 1', capacidade = 0, tipo = 'import'  },
	{ hash = 2009693397, name = 'porsche930', price = 100000, banido = false, modelo = 'Porsche 930', capacidade = 0, tipo = 'import'  },
	{ hash = 624514487, name = 'raptor2017', price = 500000, banido = false, modelo = 'Ford Raptor 2017', capacidade = 200, tipo = 'exclusive'  },
	{ hash = -2096912321, name = 'filthynsx', price = 1800000, banido = false, modelo = 'Honda NSX', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 1603211447, name = 'eclipse', price = 1000000, banido = false, modelo = 'Mitsubishi Eclipse', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 949614817, name = 'lp700r', price = 1000000, banido = false, modelo = 'Lamborghini LP700R', capacidade = 50, tipo = 'exclusive', class = "vip"  },
	{ hash = 765170133, name = 'db11', price = 1000000, banido = false, modelo = 'Aston Martin DB11', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 1069692054, name = 'beetle74', price = 100000, banido = false, modelo = 'Fusca 74', capacidade = 0, tipo = 'import'  },
	{ hash = 1649254367, name = 'fe86', price = 100000, banido = false, modelo = 'Escorte', capacidade = 0, tipo = 'import'  },
	{ hash = -251450019, name = 'type263', price = 100000, banido = false, modelo = 'Kombi 63', capacidade = 0, tipo = 'import'  },
	{ hash = -1152345593, name = 'yzfr125', price = 1000000, banido = false, modelo = 'Yamaha YZF R125', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 2037834373, name = 'flatbed3', price = 1000, banido = false, modelo = 'Reboque', capacidade = 0, tipo = 'work'  },
	{ hash = -1820486602, name = 'SVR14', price = 1000000, banido = false, modelo = 'Ranger Rover', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -1343964931, name = 'Bimota', price = 1000000, banido = false, modelo = 'Ducati Bimota', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -1221749859, name = 'bobbes2', price = 1000000, banido = false, modelo = 'Harley D. Bobber S', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -1830458836, name = 'bobber', price = 1000000, banido = false, modelo = 'Harley D. Bobber ', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -1845487887, name = 'volatus', price = 1000000, banido = false, modelo = 'Volatus', capacidade = 500, tipo = 'work'  },
	{ hash = -2049243343, name = 'rc', price = 1000000, banido = false, modelo = 'KTM RC', capacidade = 60, tipo = 'exclusive', class = "vip"  },
	{ hash = 16211617168, name = 'cargobob2', price = 1000000, banido = false, modelo = 'Cargo Bob', capacidade = 0, tipo = 'work'  },
	{ hash = 1458162435, name = 'ambunew', price = 1000, banido = false, modelo = 'Ambu SAMU', capacidade = 0, tipo = 'work'  },
	{ hash = -316898691, name = 'blazersamu', price = 1000, banido = false, modelo = 'Blazer SAMU', capacidade = 0, tipo = 'work'  },
	{ hash = 317746314, name = 'sw4samu', price = 1000, banido = false, modelo = 'SW4 SAMU', capacidade = 0, tipo = 'work'  },
	{ hash = 781938937, name = 'tigersamu', price = 1000, banido = false, modelo = 'Moto SAMU', capacidade = 0, tipo = 'work'  },
	{ hash = 1084099044, name = 'samumav', price = 1000, banido = false, modelo = 'HELI SAMU', capacidade = 0, tipo = 'work'  },
	{ hash = -1868899153, name = 'africaprf', price = 1000, banido = true, modelo = 'MOTO - PRF', capacidade = 20, tipo = 'work'  },
	{ hash = 882175746, name = 'cruzeprf2', price = 1000, banido = true, modelo = 'CRUZER - PRF', capacidade = 120, tipo = 'work'  },
	{ hash = -1985485633, name = 'cruzeprf2', price = 1000, banido = true, modelo = 'CRUZER - PRF', capacidade = 120, tipo = 'work'  },
	{ hash = 63912699, name = 'corprf', price = 1000, banido = true, modelo = 'Corola - PRF', capacidade = 120, tipo = 'work'  },
	{ hash = 334584363, name = 'traildesc', price = 1000, banido = true, modelo = 'TRAIL DESC - PC', capacidade = 0, tipo = 'work'  },
	{ hash = -113754634, name = 'helipc', price = 1000, banido = true, modelo = 'Helicóptero', capacidade = 0, tipo = 'work'  },
	{ hash = -236904349, name = 'motosamu', price = 1000, banido = true, modelo = 'Moto', capacidade = 20, tipo = 'work'  },
	{ hash = 353883353, name = 'polmav', price = 1000, banido = true, modelo = 'Helicóptero', capacidade = 60, tipo = 'work'  },
	{ hash = 1084099044, name = 'samumav', price = 1000, banido = true, modelo = 'HELI SAMU', capacidade = 0, tipo = 'work'  },
	{ hash = -100743216, name = 'hiluxpf', price = 1000, banido = true, modelo = 'Hilux', capacidade = 0, tipo = 'work'  },
	{ hash = 1341474454, name = '2015polstang', price = 1000, banido = true, modelo = 'Mustang', capacidade = 70, tipo = 'work'  },
	{ hash = 1257756827, name = 'fox600lt', price = 1000000, banido = false, modelo = 'McLaren 600LT', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -791711053, name = 'foxbent1', price = 1000000, banido = false, modelo = 'Bentley Liter 1931', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -1421258057, name = 'foxevo', price = 1000000, banido = false, modelo = 'Lamborghini EVO', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -245054982, name = 'jeepg', price = 1000000, banido = false, modelo = 'Jeep Gladiator', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 545993358, name = 'foxharley1', price = 1000000, banido = false, modelo = 'Harley-Davidson Softail F.B.', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 305501667, name = 'foxharley2', price = 1000000, banido = false, modelo = '2016 Harley-Davidson Road Glide', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 1720228960, name = 'foxleggera', price = 1000000, banido = false, modelo = 'Aston Martin Leggera', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -470882965, name = 'foxrossa', price = 1000000, banido = false, modelo = 'Ferrari Rossa', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 69730216, name = 'foxshelby', price = 1000000, banido = false, modelo = 'Ford Shelby GT500', capacidade = 0, tipo = 'exclusive', class = "vip"  },
	{ hash = 182795887, name = 'foxsian', price = 1000000, banido = false, modelo = 'Lamborghini Sian', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 1065452892, name = 'foxsterrato', price = 1000000, banido = false, modelo = 'Lamborghini Sterrato', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 16473409, name = 'foxsupra', price = 1000000, banido = false, modelo = 'Toyota Supra', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 53299675, name = 'm6x6', price = 1000000, banido = false, modelo = 'Mercedes Benz 6x6', capacidade = 0, tipo = 'exclusive'  },
	{ hash = -1677172839, name = 'm6gt3', price = 1000000, banido = false, modelo = 'BMW M6 GT3', capacidade = 0, tipo = 'exclusive'  },
	{ hash = 980885719, name = 'rmodgt63', price = 2200000, banido = false, modelo = 'Mercedes AMG GT63', capacidade = 70, tipo = 'exclusive', class = "vip"  },
	{ hash = 2047166283, name = 'bmws', price = 1000000, banido = false, modelo = 'BMW S1000', capacidade = 70, tipo = 'exclusive', class = "vip"  },


	{ hash = -984938540, name = '18Velar', price = 0, banido = true, modelo = '18Velar', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = 493030188, name = 'amarok', price = 0, banido = true, modelo = 'amarok', capacidade = 70, tipo = 'carros', class = "br"  },
	{ hash = -1481236684, name = 'aperta', price = 0, banido = true, modelo = 'aperta', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = 515734555, name = 'astra', price = 0, banido = true, modelo = 'astra', capacidade = 70, tipo = 'carros', class = "br"  },
	{ hash = 1676738519, name = 'audirs6', price = 0, banido = true, modelo = 'audirs6', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -157095615, name = 'bmwm3f80', price = 0, banido = true, modelo = 'bmwm3f80', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -13524981, name = 'bmwm4gts', price = 0, banido = true, modelo = 'bmwm4gts', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -1404319008, name = 'bmwm8', price = 0, banido = true, modelo = 'bmwm8', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = 46103174, name = 'brasilia', price = 800000, banido = false, modelo = 'brasilia', capacidade = 70, tipo = 'carros' },
	{ hash = 986848968, name = 'Camaro', price = 800000, banido = false, modelo = 'Camaro', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = 1995020435, name = 'celta', price = 800000, banido = false, modelo = 'celta', capacidade = 70, tipo = 'carros', class = "br"  },
	{ hash = 1701712977, name = 'cesc21', price = 800000, banido = false, modelo = 'cesc21', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -1456558572, name = 'chevette', price = 800000, banido = false, modelo = 'chevette', capacidade = 70, tipo = 'carros' },
	{ hash = 10019767, name = 'chiron17', price = 800000, banido = false, modelo = 'chiron17', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -1801816646, name = 'civic2010', price = 800000, banido = false, modelo = 'civic2010', capacidade = 70, tipo = 'carros', class = "br"  },
	{ hash = -1721911377, name = 'clio', price = 800000, banido = false, modelo = 'clio', capacidade = 70, tipo = 'carros', class = "br"  },
	{ hash = -380340310, name = 'corsa98', price = 800000, banido = false, modelo = 'corsa98', capacidade = 70, tipo = 'carros', class = "br"  },
	{ hash = 1833236016, name = 'corvette', price = 800000, banido = false, modelo = 'corvette', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -997601910, name = 'cronos', price = 800000, banido = false, modelo = 'cronos', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -810451130, name = 'cruze', price = 800000, banido = false, modelo = 'cruze', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = 1601422646, name = 'dodgechargersrt', price = 800000, banido = false, modelo = 'dodgechargersrt', capacidade = 70, tipo = 'carros' },
	{ hash = -193064196, name = 'escort', price = 800000, banido = false, modelo = 'escort', capacidade = 70, tipo = 'carros', class = "br"  },
	{ hash = 1663453404, name = 'evoque', price = 800000, banido = false, modelo = 'evoque', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -1112498534, name = 'ferporto', price = 800000, banido = false, modelo = 'ferporto', capacidade = 70, tipo = 'carros', class = "vip"  },
--	{ hash = -1173768715, name = 'ferrariitalia', price = 800000, banido = false, modelo = 'ferrariitalia', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -2007010518, name = 'fiesta', price = 800000, banido = false, modelo = 'fiesta', capacidade = 70, tipo = 'carros', class = "br"  },
	{ hash = -1573350092, name = 'fordmustang', price = 800000, banido = false, modelo = 'fordmustang', capacidade = 70, tipo = 'carros' },
	{ hash = -252643265, name = 'ftoro', price = 800000, banido = false, modelo = 'ftoro', capacidade = 70, tipo = 'carros', class = "br"  },
	{ hash = 1924372706, name = 'fusca', price = 800000, banido = false, modelo = 'fusca', capacidade = 70, tipo = 'carros', class = "br"  },
	{ hash = 1698933548, name = 'golg7', price = 800000, banido = false, modelo = 'golg7', capacidade = 70, tipo = 'carros', class = "br"  },
	{ hash = 1547680982, name = 'hilux2016', price = 800000, banido = false, modelo = 'hilux2016', capacidade = 70, tipo = 'carros', class = "br"  },
	--{ hash = 1718441594, name = 'i8', price = 800000, banido = false, modelo = 'i8', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = 701696699, name = 'jetta', price = 800000, banido = false, modelo = 'jetta', capacidade = 70, tipo = 'carros' },
	{ hash = 1114244595, name = 'lamborghinihuracan', price = 800000, banido = false, modelo = 'lamborghinihuracan', capacidade = 70, tipo = 'carros', class = "vip"  },
--	{ hash = 1978088379, name = 'lancerevolutionx', price = 800000, banido = false, modelo = 'lancerevolutionx', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -724045038, name = 'lp700', price = 800000, banido = false, modelo = 'lp700', capacidade = 70, tipo = 'carros', class = "vip"  },
	--{ hash = 2034235290, name = 'mazdarx7', price = 800000, banido = false, modelo = 'mazdarx7', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = 132097997, name = 'mercedesamgc63', price = 800000, banido = false, modelo = 'mercedesamgc63', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -2015218779, name = 'nissan370z', price = 800000, banido = false, modelo = 'nissan370z', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -60313827, name = 'nissangtr', price = 800000, banido = false, modelo = 'nissangtr', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = 670022011, name = 'nissangtrnismo', price = 800000, banido = false, modelo = 'nissangtrnismo', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -4816535, name = 'nissanskyliner34', price = 800000, banido = false, modelo = 'nissanskyliner34', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -1120398581, name = 'omega', price = 800000, banido = false, modelo = 'omega', capacidade = 70, tipo = 'carros' },
	{ hash = -189438188, name = 'p1', price = 800000, banido = false, modelo = 'p1', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -1683569033, name = 'paganihuayra', price = 800000, banido = false, modelo = 'paganihuayra', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -1961924436, name = 'palio97', price = 800000, banido = false, modelo = 'palio97', capacidade = 70, tipo = 'carros' },
	{ hash = 194366558, name = 'panamera17turbo', price = 800000, banido = false, modelo = 'panamera17turbo', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -1773424714, name = 'passat', price = 800000, banido = false, modelo = 'passat', capacidade = 70, tipo = 'carros' },
	{ hash = 468395564, name = 'pista', price = 800000, banido = false, modelo = 'pista', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = 1128102088, name = 'pista2', price = 800000, banido = false, modelo = 'pista2', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = 1125130375, name = 'polo', price = 800000, banido = false, modelo = 'polo', capacidade = 70, tipo = 'carros' },
	{ hash = -143695728, name = 'r820', price = 800000, banido = false, modelo = 'r820', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -493410377, name = 'RAPTOR150', price = 800000, banido = false, modelo = 'RAPTOR150', capacidade = 70, tipo = 'carros' },
	{ hash = 980885719, name = 'rmodgt63', price = 800000, banido = false, modelo = 'rmodgt63', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -110704625, name = 's10', price = 800000, banido = false, modelo = 's10', capacidade = 70, tipo = 'carros' },
	{ hash = -130814154, name = 'surfboard', price = 800000, banido = false, modelo = 'surfboard', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = 351980252, name = 'teslaprior', price = 800000, banido = false, modelo = 'teslaprior', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -1156537658, name = 'tiger', price = 800000, banido = false, modelo = 'tiger', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = 723779872, name = 'toyotasupra', price = 800000, banido = false, modelo = 'toyotasupra', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -419705714, name = 'tritonhpe', price = 800000, banido = false, modelo = 'tritonhpe', capacidade = 70, tipo = 'carros' },
	{ hash = 1062355240, name = 'uno', price = 800000, banido = false, modelo = 'uno', capacidade = 70, tipo = 'carros' },
	{ hash = -520214134, name = 'urus', price = 800000, banido = false, modelo = 'urus', capacidade = 70, tipo = 'carros' },
	{ hash = 1876694905, name = 'veloster', price = 800000, banido = false, modelo = 'veloster', capacidade = 70, tipo = 'carros' },
	{ hash = 519002268, name = 'versa', price = 800000, banido = false, modelo = 'versa', capacidade = 70, tipo = 'carros' },
	{ hash = 1473628167, name = 'vwgolf', price = 800000, banido = false, modelo = 'vwgolf', capacidade = 70, tipo = 'carros' },
	{ hash = -506359117, name = 'x6m', price = 800000, banido = false, modelo = 'x6m', capacidade = 70, tipo = 'carros', class = "vip"  },
	{ hash = -1667727259, name = 'nh2r', price = 800000, banido = false, modelo = 'nh2r', capacidade = 70, tipo = 'carros', class = "vip"  },









	{ hash = 1558333151, name = 'mbsprinter', price = 1000, banido = false, modelo = 'Tmbsprinter', capacidade = 250, tipo = 'work'  },
	{ hash = -1305684169, name = 'rota20', price = 1000, banido = true, modelo = 'rota20', capacidade = 0, tipo = 'work'  },
	{ hash = -1859450478, name = 'trail21', price = 1000, banido = true, modelo = 'trail21', capacidade = 0, tipo = 'work'  },
	{ hash = -436512684, name = 'trailchoque', price = 1000, banido = true, modelo = 'trailchoque', capacidade = 0, tipo = 'work'  },
	{ hash = 375198156, name = 'amarokpmesp', price = 1000, banido = true, modelo = 'amarokpmesp', capacidade = 0, tipo = 'work'  },
	{ hash = -1205629942, name = 'riot', price = 1000, banido = true, modelo = 'Blindado', capacidade = 0, tipo = 'work'  },
	{ hash = -861147662, name = 'xrepmerj', price = 1000, banido = true, modelo = 'XRE', capacidade = 0, tipo = 'work'  },
	{ hash = -1480984315, name = 'anpc_l200', price = 1000, banido = true, modelo = 'anpc_l200', capacidade = 0, tipo = 'work'  },
	{ hash = 592469868, name = 's10pmerj', price = 1000, banido = true, modelo = 'S10', capacidade = 150, tipo = 'work'  },
	{ hash = 1437596599, name = 'voyagepmerj', price = 1000, banido = true, modelo = 'Voyage', capacidade = 50, tipo = 'work'  },
	{ hash = -1034834222, name = 'corollapc', price = 1000, banido = true, modelo = 'Corolla', capacidade = 0, tipo = 'work'  },
	{ hash = 1016204281, name = 'dusterpc', price = 1000, banido = true, modelo = 'Duster', capacidade = 50, tipo = 'work'  },
	{ hash = -113754634, name = 'helipc', price = 1000, banido = true, modelo = 'Helicóptero', capacidade = 0, tipo = 'work'  },
	{ hash = 707765804, name = 'versapmerj', price = 1000, banido = true, modelo = 'Versa', capacidade = 0, tipo = 'work'  },
	{ hash = -236904349, name = 'motosamu', price = 1000, banido = true, modelo = 'Moto', capacidade = 20, tipo = 'work'  },
	{ hash = 353883353, name = 'polmav', price = 1000, banido = true, modelo = 'Helicóptero', capacidade = 60, tipo = 'work'  },
	{ hash = -1723962664, name = 's10bope', price = 1000, banido = true, modelo = 'S10', capacidade = 0, tipo = 'work'  },
	{ hash = 956179621, name = 'hiluxsrvbope', price = 1000, banido = true, modelo = 'Hilux', capacidade = 0, tipo = 'work'  },
	{ hash = 1084099044, name = 'samumav', price = 1000, banido = true, modelo = 'HELI SAMU', capacidade = 0, tipo = 'work'  },
	{ hash = -1205689942, name = 'riot', price = 1000, banido = true, modelo = 'Blindado', capacidade = 0, tipo = 'work'  },
	{ hash = -100743216, name = 'hiluxpf', price = 1000, banido = true, modelo = 'Hilux', capacidade = 0, tipo = 'work'  },
	{ hash = 564060192, name = 'trailpf', price = 1000, banido = true, modelo = 'trailpf', capacidade = 0, tipo = 'work'  },
	{ hash = 1341474454, name = '2015polstang', price = 1000, banido = true, modelo = 'Mustang', capacidade = 70, tipo = 'work'  },
	{ hash = -1868899153, name = 'africaprf', price = 1000, banido = true, modelo = 'MOTO - PRF', capacidade = 20, tipo = 'work'  },
	{ hash = 1458162435, name = 'ambunew', price = 1000, banido = false, modelo = 'Ambu SAMU', capacidade = 0, tipo = 'work'  },
	{ hash = -316898691, name = 'blazersamu', price = 1000, banido = false, modelo = 'Blazer SAMU', capacidade = 0, tipo = 'work'  },
	{ hash = 317746314, name = 'sw4samu', price = 1000, banido = false, modelo = 'SW4 SAMU', capacidade = 0, tipo = 'work'  },
	{ hash = 781938937, name = 'tigersamu', price = 1000, banido = false, modelo = 'Moto SAMU', capacidade = 0, tipo = 'work'  },
	{ hash = 1084099044, name = 'samumav', price = 1000, banido = false, modelo = 'HELI SAMU', capacidade = 0, tipo = 'work'  },
	{ hash = -1480984315, name = 'anpc_l200', price = 1000, banido = true, modelo = 'anpc_l200', capacidade = 0, tipo = 'work'  },
	{ hash = 592469868, name = 's10pmerj', price = 1000, banido = true, modelo = 'S10', capacidade = 150, tipo = 'work'  },
	{ hash = 1437596599, name = 'voyagepmerj', price = 1000, banido = true, modelo = 'Voyage', capacidade = 50, tipo = 'work'  },
	{ hash = -1034834222, name = 'corollapc', price = 1000, banido = true, modelo = 'Corolla', capacidade = 0, tipo = 'work'  },
	{ hash = 1016204281, name = 'dusterpc', price = 1000, banido = true, modelo = 'Duster', capacidade = 50, tipo = 'work'  },
	{ hash = -113754634, name = 'helipc', price = 1000, banido = true, modelo = 'Helicóptero', capacidade = 0, tipo = 'work'  },
	{ hash = 707765804, name = 'versapmerj', price = 1000, banido = true, modelo = 'Versa', capacidade = 0, tipo = 'work'  },
	{ hash = -236904349, name = 'motosamu', price = 1000, banido = true, modelo = 'Moto', capacidade = 20, tipo = 'work'  },
	{ hash = 353883353, name = 'polmav', price = 1000, banido = true, modelo = 'Helicóptero', capacidade = 60, tipo = 'work'  },
	{ hash = -1723962664, name = 's10bope', price = 1000, banido = true, modelo = 'S10', capacidade = 0, tipo = 'work'  },
	{ hash = 956179621, name = 'hiluxsrvbope', price = 1000, banido = true, modelo = 'Hilux', capacidade = 0, tipo = 'work'  },
	{ hash = 1084099044, name = 'samumav', price = 1000, banido = true, modelo = 'HELI SAMU', capacidade = 0, tipo = 'work'  },
	{ hash = -1205689942, name = 'riot', price = 1000, banido = true, modelo = 'Blindado', capacidade = 0, tipo = 'work'  },
	{ hash = -100743216, name = 'hiluxpf', price = 1000, banido = true, modelo = 'Hilux', capacidade = 0, tipo = 'work'  },
	{ hash = 564060192, name = 'trailpf', price = 1000, banido = true, modelo = 'trailpf', capacidade = 0, tipo = 'work'  },
	{ hash = 1341474454, name = '2015polstang', price = 1000, banido = true, modelo = 'Mustang', capacidade = 70, tipo = 'work'  },
	{ hash = -195053128, name = 'blazer11', price = 1000, banido = false, modelo = 'BLAZER - FT', capacidade = 30, tipo = 'work'  },
	{ hash = -403808748, name = 'xre2019', price = 1000, banido = false, modelo = 'xre2019', capacidade = 150, tipo = 'work'  },
	{ hash = 323426592, name = 'trailcfp', price = 1000, banido = false, modelo = 'TRAIL - PMESP', capacidade = 150, tipo = 'work'  },
	{ hash = -1801352356, name = 'trailbaep', price = 1000, banido = false, modelo = 'trail - baep', capacidade = 150, tipo = 'work'  },
	{ hash = 1171614426, name = 'ambulance', price = 1000, banido = false, modelo = 'Ambulância', capacidade = 0, tipo = 'work'  },
	{ hash = -1569874267, name = 'tigerrocam', price = 1000, banido = false, modelo = 'tigerrocam - PMESP', capacidade = 150, tipo = 'work'  },
	{ hash = 14375996599, name = 'voyagepmerj', price = 1000, banido = false, modelo = 'Voyage', capacidade = 50, tipo = 'work'  },
	{ hash = -2072933068, name = 'coach', price = 1000, banido = false, modelo = 'Ônibus', capacidade = 0, tipo = 'work'  },
	{ hash = 592469868, name = 's10pmerj', price = 1000, banido = false, modelo = 'S10', capacidade = 150, tipo = 'work'  },
	{ hash = 1016204281, name = 'dusterpc', price = 1000, banido = false, modelo = 'Duster', capacidade = 50, tipo = 'work'  },
	{ hash = -701653192, name = 'trailcivileie', price = 1000, banido = false, modelo = 'trailcivileie', capacidade = 0, tipo = 'work'  },
	{ hash = 882175746, name = 'cruzeprf2', price = 1000, banido = false, modelo = 'CRUZER - PRF', capacidade = 120, tipo = 'work'  },
	{ hash = 137952352, name = 'sw4', price = 1000, banido = false, modelo = 'sw4 - FT', capacidade = 150, tipo = 'work'  },
	{ hash = -1106997245, name = 'Spin2', price = 1000, banido = false, modelo = 'spin - PMESP', capacidade = 150, tipo = 'work'  },
	{ hash = -1608541323, name = 'Palio2018', price = 1000, banido = false, modelo = 'Palio - PMESP', capacidade = 150, tipo = 'work'  },
	{ hash = 1396759790, name = 'spacerp', price = 1000, banido = false, modelo = 'SPACE - PMESP', capacidade = 150, tipo = 'work'  },
	--{ hash = 991407206, name = 'r1250', price = 450000, banido = false, modelo = 'BMW R1250', capacidade = 15, tipo = 'motos'  },
	{ hash = -604553472, name = 'spinpmesp', price = 1000, banido = false, modelo = 'spinpmesp', capacidade = 0, tipo = 'work'  },
	{ hash = 2134283699, name = 'golpmesp', price = 1000, banido = false, modelo = 'golpmesp', capacidade = 0, tipo = 'work'  },
	{ hash = -1668722828, name = 'paliopmrp1', price = 1000, banido = false, modelo = 'PALIO - PMESP', capacidade = 0, tipo = 'work'  },
	{ hash = 954201204, name = 'sw4ft2019', price = 1000, banido = false, modelo = 'sw4ft2019', capacidade = 0, tipo = 'work'  },
	{ hash = -956048545, name = 'taxi', price = 1000, banido = false, modelo = 'taxi', capacidade = 0, tipo = 'work'  },
	{ hash = -196245904, name = 'fx50s', price = 1000, banido = false, modelo = 'Taxi du robyssuu', capacidade = 0, tipo = 'work'  },
	{ hash = 1853022133, name = 'spinrp4', price = 1000, banido = false, modelo = 'spinrp4', capacidade = 0, tipo = 'work'  },
	{ hash = 827160043, name = 'trail19goe', price = 1000, banido = false, modelo = 'trail19goe', capacidade = 0, tipo = 'work'  },
	{ hash = -254813818, name = 'trailgarra1', price = 1000, banido = false, modelo = 'TRAIL - GARRA', capacidade = 0, tipo = 'work'  },
	{ hash = 1849390405, name = 'xtbaep', price = 1000, banido = false, modelo = 'xtbaep', capacidade = 0, tipo = 'work'  },
	{ hash = 765381769, name = 'r1250policia', price = 1000, banido = false, modelo = 'r1250policia', capacidade = 0, tipo = 'work'  },
	{ hash = 1838498121, name = 'trailtor', price = 1000, banido = false, modelo = 'trailtor', capacidade = 0, tipo = 'work'  },
	{ hash = -1625578173, name = 'trailbaep4', price = 1000, banido = false, modelo = 'trailbaep4', capacidade = 0, tipo = 'work'  },
	{ hash = 1838498121, name = 'trailtor', price = 1000, banido = false, modelo = 'trailtor', capacidade = 0, tipo = 'work'  },
	{ hash = 1838498121, name = 'trailtor', price = 1000, banido = false, modelo = 'trailtor', capacidade = 0, tipo = 'work'  },
	{ hash = 541571566, name = 'hilux18tor', price = 1000, banido = false, modelo = 'hilux18tor - TOR', capacidade = 0, tipo = 'work'  },
	{ hash = -137337379, name = 'amarokpolicia', price = 1000, banido = false, modelo = 'amarokpolicia', capacidade = 0, tipo = 'work'  },
	--{ hash = 323027250, name = 'm5speed', price = 1000, banido = false, modelo = 'm5speed', capacidade = 0, tipo = 'work'  },
	{ hash = 1618724570, name = 'm8poli', price = 1000, banido = false, modelo = 'm8poli', capacidade = 0, tipo = 'work'  },
	{ hash = 837100403, name = 'mercedespolicia', price = 1000, banido = false, modelo = 'mercedespolicia', capacidade = 0, tipo = 'work'  },
	{ hash = 1558333151, name = 'mbsprinter', price = 1000, banido = false, modelo = 'mbsprinter', capacidade = 0, tipo = 'work'  },
	{ hash = -1253209116, name = 'amgpolgtr', price = 1000, banido = false, modelo = 'amgpolgtr', capacidade = 0, tipo = 'work'  },
	{ hash = -1878793377, name = 'chevypolicia', price = 1000, banido = false, modelo = 'chevypolicia', capacidade = 0, tipo = 'work'  },
	{ hash = 765381769, name = 'r1250policia', price = 1000, banido = false, modelo = 'r1250policia', capacidade = 0, tipo = 'work'  },
	{ hash = 1558333151, name = 'Mercedes', price = 1000, banido = false, modelo = 'Mercedes', capacidade = 0, tipo = 'work'  },
	{ hash = 1938952078, name = 'firetruk', price = 1000, banido = false, modelo = 'firetruk', capacidade = 0, tipo = 'work'  },


	{ hash = 2119857727, name = 'fibStockade', price = 1000, banido = false, modelo = 'fibStockade', capacidade = 0, tipo = 'work'  },
	{ hash = 638624903, name = '535ihiorg', price = 1000, banido = false, modelo = '535ihiorg', capacidade = 0, tipo = 'work'  },
	{ hash = 1674781830, name = 'sheriffsci', price = 1000, banido = false, modelo = 'sheriffsci', capacidade = 0, tipo = 'work'  },
	{ hash = -1603490350, name = 'gnr_evoque', price = 1000, banido = false, modelo = 'gnr_evoque', capacidade = 0, tipo = 'work'  },
	{ hash = -176428651, name = 'gnr_i8', price = 1000, banido = false, modelo = 'gnr_i8', capacidade = 0, tipo = 'work'  },
	{ hash = -371354667, name = 'gnr_jeep', price = 1000, banido = false, modelo = 'gnr_jeep', capacidade = 0, tipo = 'work'  },
	{ hash = -371354667, name = 'gnrdef', price = 1000, banido = false, modelo = 'gnrdef', capacidade = 0, tipo = 'work'  },
	{ hash = 108315334, name = 'gnrt', price = 1000, banido = false, modelo = 'gnrt', capacidade = 0, tipo = 'work'  },
	{ hash = 1922257928, name = 'sheriff2', price = 1000, banido = false, modelo = 'sheriff2', capacidade = 0, tipo = 'work'  },
	{ hash = 493361920, name = 'sheriffx6', price = 1000, banido = false, modelo = 'sheriffx6', capacidade = 0, tipo = 'work'  },
	{ hash = 1290625256, name = 'as332', price = 1000, banido = false, modelo = 'as332', capacidade = 0, tipo = 'work'  },
	{ hash = -304857564, name = 'ghispo2', price = 1000, banido = false, modelo = 'ghispo2', capacidade = 0, tipo = 'work'  },
	{ hash = -1054205082, name = 'gnr_1200', price = 1000, banido = false, modelo = 'gnr_1200', capacidade = 0, tipo = 'work'  },
	{ hash = 1903559315, name = 'amgafter', price = 1000, banido = false, modelo = 'amgafter', capacidade = 0, tipo = 'work'  },
	{ hash = -300858445, name = 'fordpolice', price = 1000, banido = false, modelo = 'fordpolice', capacidade = 0, tipo = 'work'  },
	{ hash = -1643074427, name = 'clapsp', price = 1000, banido = false, modelo = 'clapsp', capacidade = 0, tipo = 'work'  },
	{ hash = 1247161066, name = 'm5psp', price = 1000, banido = false, modelo = 'm5psp', capacidade = 0, tipo = 'work'  },
	{ hash = 2046537925, name = 'police', price = 1000, banido = false, modelo = 'police', capacidade = 0, tipo = 'work'  },
	{ hash = -1627000575, name = 'police2', price = 1000, banido = false, modelo = 'police2', capacidade = 0, tipo = 'work'  },
	{ hash = 1912215274, name = 'police3', price = 1000, banido = false, modelo = 'police3', capacidade = 0, tipo = 'work'  },
	{ hash = -1214204957, name = 'policer8', price = 1000, banido = false, modelo = 'policer8', capacidade = 0, tipo = 'work'  },
	{ hash = 617322123, name = 'policesu', price = 1000, banido = false, modelo = 'policesu', capacidade = 0, tipo = 'work'  },
	{ hash = 456714581, name = 'policet', price = 1000, banido = false, modelo = 'policet', capacidade = 0, tipo = 'work'  },
	{ hash = -1683328900, name = 'sheriff', price = 1000, banido = false, modelo = 'sheriff', capacidade = 0, tipo = 'work'  },

	{ hash = -826160737, name = 'EC135', price = 1000, banido = false, modelo = 'EC135', capacidade = 0, tipo = 'work'  },
	{ hash = 1416125959, name = 'ems_gs1200', price = 1000, banido = false, modelo = 'ems_gs1200', capacidade = 0, tipo = 'work'  },
	{ hash = -1480984315, name = 'anpc_l200', price = 1000, banido = false, modelo = 'L200', capacidade = 0, tipo = 'work'  },
	{ hash = 312796341, name = 'inem_vwcrafter', price = 1000, banido = false, modelo = 'inem_vwcrafter', capacidade = 0, tipo = 'work'  },
	{ hash = 744705981, name = 'frogger', price = 1000, banido = false, modelo = 'frogger', capacidade = 0, tipo = 'work'  },
	{ hash = 960601547, name = 'sxrpolicia', price = 1000, banido = false, modelo = 'sxrpolicia', capacidade = 0, tipo = 'work'  },


	{ hash = -1693633642, name = 'VRa45', price = 1000, banido = true, modelo = 'VRa45', capacidade = 70, tipo = 'work'  },
	{ hash = 744705981, name = 'frogger', price = 1000, banido = true, modelo = 'frogger', capacidade = 70, tipo = 'work'  },
	{ hash = 312796341, name = 'inem_vwcrafter', price = 1000, banido = true, modelo = 'inem_vwcrafter', capacidade = 70, tipo = 'work'  },
	{ hash = -1620637, name = 'amggtrpolicia', price = 1000, banido = true, modelo = 'amggtrpolicia', capacidade = 70, tipo = 'work'  },
	{ hash = -1009943917, name = 'azulvan', price = 1000, banido = true, modelo = 'azulvan', capacidade = 70, tipo = 'work'  },
	{ hash = -1716265505, name = 'bahamasvan', price = 1000, banido = true, modelo = 'bahamasvan', capacidade = 70, tipo = 'work'  },
	{ hash = 603627429, name = 'hcampana', price = 1000, banido = true, modelo = 'hcampana', capacidade = 70, tipo = 'work'  },
	{ hash = 2066624525, name = 'cb500pol', price = 1000, banido = true, modelo = 'cb500pol', capacidade = 70, tipo = 'work'  },
	{ hash = -49421362, name = 'cinzavan', price = 1000, banido = true, modelo = 'cinzavan', capacidade = 70, tipo = 'work'  },
	{ hash = 1322123305, name = 'f450c', price = 1000, banido = true, modelo = 'f450c', capacidade = 70, tipo = 'work'  },
	{ hash = 1317757953, name = 'f550rbc', price = 1000, banido = true, modelo = 'f550rbc', capacidade = 70, tipo = 'work'  },
	{ hash = -1470089635, name = 'newsmav', price = 1000, banido = true, modelo = 'newsmav', capacidade = 70, tipo = 'work'  },
	{ hash = -826160737, name = 'EC135', price = 1000, banido = true, modelo = 'EC135', capacidade = 70, tipo = 'work'  },
	{ hash = -752543831, name = 'laranjavan', price = 1000, banido = true, modelo = 'laranjavan', capacidade = 70, tipo = 'work'  },
	{ hash = -752543831, name = 'm4pol2021', price = 1000, banido = true, modelo = 'm4pol2021', capacidade = 70, tipo = 'work'  },
	{ hash = 1640719864, name = 'mercedespol', price = 1000, banido = true, modelo = 'mercedespol', capacidade = 70, tipo = 'work'  },
	{ hash = 311019464, name = 'mini', price = 1000, banido = true, modelo = 'mini', capacidade = 70, tipo = 'work'  },
	{ hash = -1209063974, name = 'mustangwpol', price = 1000, banido = true, modelo = 'mustangwpol', capacidade = 70, tipo = 'work'  },
	{ hash = 765381769, name = 'r1250policia', price = 1000, banido = true, modelo = 'r1250policia', capacidade = 70, tipo = 'work'  },
	{ hash = -722708199, name = 'VRrs6av', price = 1000, banido = true, modelo = 'VRrs6av', capacidade = 70, tipo = 'work'  },
	{ hash = 960601547, name = 'sxrpolicia', price = 1000, banido = true, modelo = 'sxrpolicia', capacidade = 70, tipo = 'work'  },
	{ hash = 1987735581, name = '17silv', price = 1000, banido = true, modelo = '17silv', capacidade = 70, tipo = 'work'  },
	{ hash = 1162065741, name = 'rumpo', price = 1000, banido = true, modelo = 'rumpo', capacidade = 70, tipo = 'work'  },
	{ hash = 1285980724, name = 'vanillavan', price = 1000, banido = true, modelo = 'vanillavan', capacidade = 70, tipo = 'work'  },
	{ hash = -1749405252, name = 'verdesvan', price = 1000, banido = true, modelo = 'verdesvan', capacidade = 70, tipo = 'work'  },
	{ hash = -1276686320, name = 'vermelhosvan', price = 1000, banido = true, modelo = 'vermelhosvan', capacidade = 70, tipo = 'work'  },

	{ hash = -1284811839, name = 'WRasprinter', price = 1000, banido = true, modelo = 'WRasprinter', capacidade = 50, tipo = 'work'  },
	{ hash = -1304564705, name = 'WRgle53', price = 1000, banido = true, modelo = 'WRgle53', capacidade = 50, tipo = 'work'  },
	{ hash = 1775498021, name = 'WRr1200', price = 1000, banido = true, modelo = 'WRr1200', capacidade = 50, tipo = 'work'  },
	{ hash = -1470089635, name = 'newsmav', price = 1000, banido = true, modelo = 'newsmav', capacidade = 50, tipo = 'work'  },
	{ hash = -50123501, name = 'WRgtr', price = 1000, banido = true, modelo = 'WRgtr', capacidade = 50, tipo = 'work'  },
	{ hash = -2138368019, name = 'WR19raptor', price = 1000, banido = true, modelo = 'WR19raptor', capacidade = 150, tipo = 'work'  },
	{ hash = 1654989418, name = 'WRa45', price = 1000, banido = true, modelo = 'WRa45', capacidade = 50, tipo = 'work'  },
	{ hash = 1001000391, name = 'WRc8', price = 1000, banido = true, modelo = 'WRc8', capacidade = 50, tipo = 'work'  },
	{ hash = 1352331482, name = 'WRcls63s', price = 1000, banido = true, modelo = 'WRcls63s', capacidade = 50, tipo = 'work'  },
	{ hash = 1403490019, name = 'WRgt63', price = 1000, banido = true, modelo = 'WRgt63', capacidade = 50, tipo = 'work'  },
	{ hash = -1868138629, name = 'WRsxr', price = 1000, banido = true, modelo = 'WRsxr', capacidade = 50, tipo = 'work'  },
	{ hash = 431385387, name = 'WRclassxv2', price = 1000, banido = true, modelo = 'WRclassxv2', capacidade = 50, tipo = 'work'  },
	{ hash = -100632271, name = 'WRr1200p', price = 1000, banido = true, modelo = 'WRr1200p', capacidade = 50, tipo = 'work'  },
	{ hash = -535280261, name = 'WRpolmav', price = 1000, banido = true, modelo = 'WRpolmav', capacidade = 50, tipo = 'work'  },




}
----------------------------------------------
----------------------------------------------


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



-----------------------------------------------------------------
------------- GARAGENS PÚBLICAS E DE SERVIÇO --------------------
-----------------------------------------------------------------

config.garages = {
	[1] = { type = 'public', coords = vec3(55.43,-876.19,30.66), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(50.66,-873.02,30.45), h = 159.65 },
		[2] = { vec3(47.34,-871.81,30.45), h = 159.65 },
		[3] = { vec3(44.17,-870.5,30.45), h = 159.65 },
	  },
	},
	[2] = { type = 'public', coords = vec3(596.4,90.65,93.12), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(599.38,98.16,92.06), h = 249.86 },
		[2] = { vec3(600.74,101.16,92.06), h = 249.86 },
	  },
	},
	[3] = { type = 'public', coords = vec3(-340.76,265.97,85.67), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-329.74,274.2,85.44), h = 93.8 },
		[2] = { vec3(-329.88,277.63,85.43), h = 93.8 },
	  },
	},
	[4] = { type = 'public', coords = vec3(0,0,0), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-2024.27,-471.93,11.4), h = 140.0 },
		[2] = { vec3(-2021.9,-474.17,11.4), h = 140.0 },
	  },
	},
	[5] = { type = 'public', coords = vec3(-1184.92,-1510.0,4.64), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1183.49,-1495.92,4.37), h = 125.0 },
		[2] = { vec3(-1186.7,-1490.54,4.37), h = 125.0 },
	  },
	},
	[6] = { type = 'public', coords = vec3(-73.44,-2004.99,18.27), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-84.96,-2004.22,18.01), h = 352.0 },
	  },
	},
	[7] = { type = 'public', coords = vec3(214.02,-808.44,31.01), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(222.11,-804.16,29.83), h = 247.0 },
		[2] = { vec3(224.14,-799.27,29.83), h = 247.0 },
	  },
	},
	[8] = { type = 'public', coords = vec3(-348.88,-874.02,31.31), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-343.73,-875.45,30.22), h = 168.42 },
		[2] = { vec3(-340.11,-877.03,30.22), h = 168.42 },
		[3] = { vec3(-336.49,-877.69,30.22), h = 168.42 },
	  },
	},
	[9] = { type = 'public', coords = vec3(67.74,12.27,69.21), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(64.17,17.22,68.37), h = 339.38 },
		[2] = { vec3(61.17,18.4,68.42), h = 339.38 },
	  },
	},
	[10] = { type = 'public', coords = vec3(361.9,297.81,103.88), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(361.08,293.5,102.65), h = 249.67 },
		[2] = { vec3(360.02,289.8,102.64), h = 249.67 },
		[3] = { vec3(358.35,286.42,102.62), h = 249.67 },
	  },
	},
	[11] = { type = 'public', coords = vec3(-773.34,5598.15,33.6), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-772.82,5578.48,32.64), h = 89.01 },
		[2] = { vec3(-773.07,5575.31,32.64), h = 89.01 },
	  },
	},
	[12] = { type = 'public', coords = vec3(323.5,-203.07,54.08), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(318.07,-203.28,53.24), h = 249.14 },
		[2] = { vec3(316.71,-206.49,53.24), h = 249.14 },
		[3] = { vec3(315.57,-209.74,53.24), h = 249.14 },
	  },
	},
	[13] = { type = 'public', coords = vec3(317.25,2623.14,44.46), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(334.52,2623.09,44.49), h = 20.0 },
	  },
	},
	[14] = { type = 'public', coords = vec3(1156.9,-453.73,66.98), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1155.2,-461.58,65.97), h = 167.96 },
		[2] = { vec3(1151.76,-460.61,65.96), h = 167.96 },
	  },
	},
	[15] = { type = 'public', coords = vec3(-102.21,6345.18,31.57), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-98.29,6341.76,30.64), h = 224.27 },
		[2] = { vec3(-95.52,6344.59,30.64), h = 224.27 },
		[3] = { vec3(-92.98,6347.16,30.64), h = 224.27 },
		[4] = { vec3(-85.39,6338.94,30.64), h = 44.8 },
	  },
	},
	[16] = { type = 'public', coords = vec3(-1120.57,-830.7,13.33), perm = 'policia.permissao',
	  vehiclePositions = {
		[1] = { vec3(-1112.66,-854.46,13.24), h = 217.97 },
		[2] = { vec3(-1116.46,-857.16,13.24), h = 217.97 },
		[3] = { vec3(-1123.18,-862.36,13.29), h = 217.97 },
		[4] = { vec3(-1126.36,-864.51,13.28), h = 217.97 },
	  },
	},
	[17] = { type = 'service', coords = vec3(2554.57, -356.5, 93.12), perm = 'policia.permissao', --
	  vehiclePositions = {
		[1] = { vec3(2552.01, -362.36, 93.0), h = 2.75 },
		[2] = { vec3(2556.04, -362.04, 93.0), h = 2.75 },
	  },
	  vehicles = {
		{ vehicle = 'WRgtr', modelo = 'WRgtr' },
		{ vehicle = 'WR19raptor', modelo = 'WR19raptor' },
		{ vehicle = 'WRa45', modelo = 'WRa45' },
		{ vehicle = 'WRc8', modelo = 'WRc8' },
		{ vehicle = 'WRcls63s', modelo = 'WRcls63s' },
		{ vehicle = 'WRgt63', modelo = 'WRgt63' },  
		{ vehicle = 'WRclassxv2', modelo = 'WRclassxv2' }, 
		{ vehicle = 'WRr1200p', modelo = 'WR1200p' }, 
		{ vehicle = 'WRsxr', modelo = 'WRSXR' },
		{ vehicle = 'WRpolmav', modelo = 'WRpolmav' },  
	  }
	},
	[18] = { type = 'service', coords = vec3( 1116.74,-1509.32, 34.85), perm = 'paramedico.permissao', --Inem
	  vehiclePositions = {
		[1] = { vec3( 1116.41, -1506.17, 34.7), h = 79.08 },
	  },
	  vehicles = {
		{ vehicle = 'Wrasprinter', modelo = 'Wrasprinter' },
		{ vehicle = 'Wrgle53', modelo = 'Wrgle53' },
		{ vehicle = 'WRr1200', modelo = 'WRr1200' },
		
		 
	  }
	},
	[19] = { type = 'service', coords = vec3(1163.26, -1532.58, 39.41), perm = 'paramedico.permissao',
	  vehiclePositions = {
		[1] = { vec3(1169.52, -1538.14, 39.41), h = 247.48 },
	  },
	  vehicles = {
		{ vehicle = 'polmav', modelo = 'polmav' },  
	  }
	},
	[20] = { type = 'service', coords = vec3(0,0,0), perm = 'policia.permissao', 
	  vehiclePositions = {
		[1] = { vec3(-1067.41,-856.54,4.87), h = 180.0 },
	  },
	  vehicles = {
		{ vehicle = 'fibStockade', modelo = 'GIOE' },
		{ vehicle = '535ihiorg', modelo = '535ihiorg' },
		{ vehicle = 'sheriffsci', modelo = 'sheriffsci' },
		{ vehicle = 'gnr_evoque', modelo = 'gnr_evoque' },
		{ vehicle = 'gnr_i8', modelo = 'gnr_i8' },
		{ vehicle = 'gnr_jeep', modelo = 'gnr_jeep' },
		{ vehicle = 'gnrdef', modelo = 'gnrdef' },
		{ vehicle = 'gnrt', modelo = 'gnrt' },
		{ vehicle = 'sheriff2', modelo = 'sheriff2' }, 
		{ vehicle = 'sheriffx6', modelo = 'sheriffx6' },
		{ vehicle = 'as332', modelo = 'as332' },
		{ vehicle = 'ghispo2', modelo = 'ghispo2' },
		{ vehicle = 'gnr_1200', modelo = 'gnr_1200' }, 
	  }
	},
	[21] = { type = 'service', coords = vec3(0,0,0), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(899.35, -181.17, 73.84), h = 237.93 },
	  },
	  vehicles = {
		{ vehicle = 'taxi', modelo = 'taxi' }, 

	  }
	},
	[22] = { type = 'service', coords = vec3(0,0,0), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(462.51,-605.27,29.32), h = 214.04 },
		[2] = { vec3(461.44,-611.34,29.33), h = 214.04 },
	  },
	  vehicles = {
		{ vehicle = 'coach', modelo = 'coach' },  
	  }
	},
	[23] = { type = 'service', coords = vec3(0,0,0), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-411.44,-2791.45,6.01), h = 160.0 },
	  },
	  vehicles = {
		{ vehicle = 'boxville2', modelo = 'boxville2' },
		{ vehicle = 'tribike3', modelo = 'tribike3' },  
	  }
	},
	[24] = { type = 'service', coords = vec3(0,0,0), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-342.17,-1560.1,25.23), h = 100.0 },
	  },
	  vehicles = {
		{ vehicle = 'trash2', modelo = 'trash2' },  
	  }
	},
	[25] = { type = 'service', coords = vec3(0,0,0), perm = nil,
	  vehiclePositions = {  --Mineração
		[1] = { vec3(1063.75, -1961.69, 31.02), h = 55.04 },
		--[2] = { vec3(156.82135009766,-1451.13671875,29.1416015625), h = 144.83 },
	  },
	  vehicles = {
		{ vehicle = 'tiptruck', modelo = 'tiptruck' },  
	  }
	},
	[26] = { type = 'service', coords = vec3(0,0,0), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1250.5166015625,-304.17153930664,37.154411315918), h = 55.04 },
		[2] = { vec3(-1252.7307128906,-305.26202392578,37.107055664063), h = 144.83 },
	  },
	  vehicles = {
		{ vehicle = 'faggio2', modelo = 'faggio2' },  
	  }
	},
	[27] = { type = 'service', coords = vec3(0,0,0), perm = 'pmkr.permissao',
	  vehiclePositions = {
		[1] = { vec3(388.83,-1612.46,29.3), h = 182.07 },
		[2] = { vec3(391.25,-1609.43,29.3), h = 182.07 },
	  },
	  vehicles = {
		{ vehicle = '2015polstang', modelo = '2015polstang' },
		{ vehicle = 'hiluxpf', modelo = 'hiluxpf' },
		{ vehicle = 'trailpf', modelo = 'trailpf' },  
	  }
	},
	[28] = { type = 'service', coords = vec3(0,0,0), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1205.13, -3267.49, 5.52), h = 256.11 },
	  },
	  vehicles = {
		{ vehicle = 'phantom', modelo = 'phantom' },
		{ vehicle = 'hauler', modelo = 'hauler' },  
	  }
	},
	[29] = { type = 'service', coords = vec3(-1605.19,-1164.37,1.28), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1619.61,-1175.78,-0.08), h = 130.0 },
	  },
	  vehicles = {
		{ vehicle = 'dinghy', modelo = 'dinghy' },
		{ vehicle = 'jetmax', modelo = 'jetmax' },
		{ vehicle = 'marquis', modelo = 'marquis' },
		{ vehicle = 'seashark3', modelo = 'seashark3' },
		{ vehicle = 'speeder', modelo = 'speeder' },
		{ vehicle = 'speeder2', modelo = 'speeder2' },
		{ vehicle = 'squalo', modelo = 'squalo' },
		{ vehicle = 'suntrap', modelo = 'suntrap' },
		{ vehicle = 'toro', modelo = 'toro' },
		{ vehicle = 'toro2', modelo = 'toro2' },
		{ vehicle = 'tropic', modelo = 'tropic' },
		{ vehicle = 'tropic2', modelo = 'tropic2' },  
	  }
	},
	[30] = { type = 'service', coords = vec3(-1522.68,1494.92,111.58), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1526.63,1499.64,109.08), h = 350.0 },
	  },
	  vehicles = {
		{ vehicle = 'dinghy', modelo = 'dinghy' },
		{ vehicle = 'jetmax', modelo = 'jetmax' },
		{ vehicle = 'marquis', modelo = 'marquis' },
		{ vehicle = 'seashark3', modelo = 'seashark3' },
		{ vehicle = 'speeder', modelo = 'speeder' },
		{ vehicle = 'speeder2', modelo = 'speeder2' },
		{ vehicle = 'squalo', modelo = 'squalo' },
		{ vehicle = 'suntrap', modelo = 'suntrap' },
		{ vehicle = 'toro', modelo = 'toro' },
		{ vehicle = 'toro2', modelo = 'toro2' },
		{ vehicle = 'tropic', modelo = 'tropic' },
		{ vehicle = 'tropic2', modelo = 'tropic2' },  
	  }
	},
	[31] = { type = 'service', coords = vec3(1337.36,4269.71,31.5), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1343.24,4269.59,30.11), h = 190.0 },
	  },
	  vehicles = {
		{ vehicle = 'dinghy', modelo = 'dinghy' },
		{ vehicle = 'jetmax', modelo = 'jetmax' },
		{ vehicle = 'marquis', modelo = 'marquis' },
		{ vehicle = 'seashark3', modelo = 'seashark3' },
		{ vehicle = 'speeder', modelo = 'speeder' },
		{ vehicle = 'speeder2', modelo = 'speeder2' },
		{ vehicle = 'squalo', modelo = 'squalo' },
		{ vehicle = 'suntrap', modelo = 'suntrap' },
		{ vehicle = 'toro', modelo = 'toro' },
		{ vehicle = 'toro2', modelo = 'toro2' },
		{ vehicle = 'tropic', modelo = 'tropic' },
		{ vehicle = 'tropic2', modelo = 'tropic2' },  
	  }
	},
	[32] = { type = 'public', coords = vec3(1166.16,-1538.06,34.85), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1166.3, -1546.29,34.7), h = 90.73 },
		[2] = { vec3(1176.82, -1545.47, 34.7), h = 180.73 },
	  },
	},
	[33] = { type = 'service', coords = vec3(0,0,0), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(196.79,-1254.8,29.24), h = 92.0 },
	  },
	  vehicles = {
		{ vehicle = 'rebel', modelo = 'rebel' },  
	  }
	},
	[34] = { type = 'public', coords = vec3(-40.63, -1113.84, 26.44), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-44.9, -1116.76, 26.44), h = 357.47 },
		[2] = { vec3(-50.65, -1115.3, 26.44), h = 358.81 },
	  },
	},
	[35] = { type = 'service', coords = vec3(-569.55,-925.95,36.833), perm = 'news.permissao',
	  vehiclePositions = {
		[1] = { vec3(-582.39,-930.48,36.83), h = 75.0 },
	  },
	  vehicles = {
		{ vehicle = 'frogger', modelo = 'frogger' },  
	  }
	},
	[36] = { type = 'service', coords = vec3(0,0,0), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(727.73, -1983.38, 29.3), h = 262.88 },
		[1] = { vec3(727.68, -1987.83, 29.3), h = 262.88 },
	  },
	  vehicles = {
		{ vehicle = 'asea', modelo = 'asea' },  
	  }
	},
	[37] = { type = 'service', coords = vec3(-1833.18, -1213.41, 13.02), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1833.25, -1218.39, 13.02), h = 222.07 },
		[2] = { vec3(-1833.02,-1217.5,13.02), h = 222.07 },
	  },
	  vehicles = {
		{ vehicle = 'scorcher', modelo = 'scorcher' },
		{ vehicle = 'tribike', modelo = 'tribike' },
		{ vehicle = 'tribike2', modelo = 'tribike2' },
		{ vehicle = 'tribike3', modelo = 'tribike3' },
		{ vehicle = 'fixter', modelo = 'fixter' },
		{ vehicle = 'cruiser', modelo = 'cruiser' },
		{ vehicle = 'bmx', modelo = 'bmx' },  
	  }
	},
	[38] = { type = 'public', coords = vec3(-71.8,908.73,235.63), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-68.15,901.37,235.57), h = 4.19 },
	  },
	},
	[39] = { type = 'public', coords = vec3(-3219.49,824.81,13.07), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-3207.54,821.18,13.07), h = 124.8 },
	  },
	},
	[40] = { type = 'service', coords = vec3(-1032.42,-2729.63,13.76), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1029.59,-2726.55,13.63), h = 305.88 },
		[2] = { vec3(-1032.2,-2723.99,13.68), h = 305.88 },
	  },
	  vehicles = {
		{ vehicle = 'scorcher', modelo = 'scorcher' },
		{ vehicle = 'tribike', modelo = 'tribike' },
		{ vehicle = 'tribike2', modelo = 'tribike2' },
		{ vehicle = 'tribike3', modelo = 'tribike3' },
		{ vehicle = 'fixter', modelo = 'fixter' },
		{ vehicle = 'cruiser', modelo = 'cruiser' },
		{ vehicle = 'bmx', modelo = 'bmx' },  
	  }
	},
	[41] = { type = 'service', coords = vec3(-2003.0,-487.53,12.22), perm = 'policia.permissao',
	  vehiclePositions = {
		[1] = { vec3(-1997.56,-485.51,7.41), h = 90.0 },
	  },
	  vehicles = {
		{ vehicle = 'wrclassxv2', modelo = 'wrclassxv2' },
		{ vehicle = 'zentorno', modelo = 'zentorno' },  
	  }
	},
	[42] = { type = 'public', coords = vec3(21.41,548.3,176.02), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(14.98,549.89,175.5), h = 60.7 },
	  },
	},
	[43] = { type = 'public', coords = vec3(-813.06,184.23,72.47), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-821.16,185.31,71.25), h = 119.13 },
	  },
	},
	[44] = { type = 'public', coords = vec3(-681.48,901.64,230.57), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-675.44,903.59,229.73), h = 326.35 },
	  },
	},
	[45] = { type = 'public', coords = vec3(-2596.87,1927.04,167.31), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-2588.73,1929.85,166.46), h = 275.01 },
	  },
	},
	[46] = { type = 'public', coords = vec3(-3014.84,740.75,27.58), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-3019.92,740.24,26.63), h = 103.34 },
	  },
	},
	[47] = { type = 'public', coords = vec3(-1890.29,-572.99,11.82), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1886.63,-571.43,10.93), h = 319.54 },
	  },
	},
	[48] = { type = 'public', coords = vec3(1551.96,2190.1,78.85), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1554.26,2196.07,78.5), h = 352.11 },
	  },
	},
	[49] = { type = 'public', coords = vec3(-2977.14,650.92,25.78), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-2982.74,654.65,25.015), h = 106.83 },
	  },
	},
	[50] = { type = 'public', coords = vec3(1398.36,1115.1,114.84), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1401.95,1118.01,114.84), h = 355.97 },
	  },
	},
	[51] = { type = 'service', coords = vec3(0,0,0), perm = 'policia.permissao',
	  vehiclePositions = {
		[1] = { vec3(1525.61,781.49,77.45), h = 3241.48 },
	  },
	  vehicles = {
		{ vehicle = 'trailtor', modelo = 'trailtor' },
		{ vehicle = 'r1250policia', modelo = 'r1250policia' },  
	  }
	},
	[52] = { type = 'service', coords = vec3(0,0,0), perm = 'admin.permissao',
	  vehiclePositions = {
		[1] = { vec3(616.05,28.28,88.95), h = 175.63 },
		[2] = { vec3(621.7,26.61,88.38), h = 215.63 },
	  },
	  vehicles = {
		{ vehicle = 'rota4', modelo = 'rota4' },
		{ vehicle = 'sw4revrota1', modelo = 'sw4revrota1' },
		{ vehicle = 'trailrota2', modelo = 'trailrota2' },  
	  }
	},
	[53] = { type = 'public', coords = vec3(-876.54,-57.11,38.05), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-869.45,-54.25,37.6), h = 281.38 },
	  },
	},
	[54] = { type = 'public', coords = vec3(-890.55,-17.35,43.1), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-885.98,-16.18,42.15), h = 304.12 },
	  },
	},
	[55] = { type = 'public', coords = vec3(-872.28,51.35,48.78), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-875.02,46.86,48.39), h = 195.46 },
	  },
	},
	[56] = { type = 'public', coords = vec3(-969.08,107.74,55.66), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-960.77,109.36,55.49), h = 314.26 },
	  },
	},
	[57] = { type = 'public', coords = vec3(-1885.63,629.92,129.99), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1890.51,626.0,129.15), h = 136.16 },
	  },
	},
	[58] = { type = 'public', coords = vec3(-997.43,142.37,60.66), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-992.02,144.19,59.81), h = 269.99 },
	  },
	},
	[59] = { type = 'public', coords = vec3(-1045.16,224.98,63.76), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1048.01,219.47,62.91), h = 184.73 },
	  },
	},
	[60] = { type = 'public', coords = vec3(-923.9,212.7,67.46), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-933.57,210.69,66.61), h = 163.52 },
	  },
	},
	[61] = { type = 'public', coords = vec3(-1026.73,363.75,71.36), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1011.08,360.01,70.05), h = 331.43 },
	  },
	},
	[62] = { type = 'public', coords = vec3(-1555.85,426.75,109.62), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1547.98,426.58,109.09), h = 272.82 },
	  },
	},
	[63] = { type = 'public', coords = vec3(-1211.88,274.79,69.51), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1204.83,267.12,68.69), h = 284.35 },
	  },
	},
	[64] = { type = 'public', coords = vec3(-1101.71,354.46,68.48), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1096.63,360.3,67.69), h = 357.45 },
	  },
	},
	[65] = { type = 'public', coords = vec3(-1490.24,18.76,54.71), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1490.16,23.07,53.88), h = 354.88 },
	  },
	},
	[66] = { type = 'public', coords = vec3(-1457.65,-50.22,54.65), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1455.68,-55.37,52.6), h = 240.6 },
	  },
	},
	[67] = { type = 'public', coords = vec3(-1504.43,19.84,56.4), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1503.75,26.86,55.15), h = 8.38 },
	  },
	},
	[68] = { type = 'public', coords = vec3(-1581.46,-81.3,54.2), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1577.19,-86.02,53.29), h = 270.66 },
	  },
	},
	[69] = { type = 'public', coords = vec3(-1585.69,-55.63,56.48), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1582.02,-61.06,55.64), h = 270.18 },
	  },
	},
	[70] = { type = 'public', coords = vec3(-1558.52,17.86,58.83), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1552.69,22.78,57.7), h = 347.5 },
	  },
	},
	[71] = { type = 'public', coords = vec3(-1616.73,14.71,62.17), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1613.07,20.02,61.32), h = 335.94 },
	  },
	},
	[72] = { type = 'public', coords = vec3(-1892.99,120.59,81.64), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1887.23,123.26,80.86), h = 338.84 },
	  },
	},
	[73] = { type = 'public', coords = vec3(-1940.13,179.1,84.66), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1932.93,182.84,83.68), h = 307.83 },
	  },
	},
	[74] = { type = 'public', coords = vec3(-2000.65,296.59,91.76), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1994.21,290.29,90.85), h = 221.21 },
	  },
	},
	[75] = { type = 'public', coords = vec3(-2013.18,453.64,102.67), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-2006.95,454.86,101.79), h = 276.63 },
	  },
	},
	[76] = { type = 'public', coords = vec3(-2016.62,485.7,107.18), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-2011.39,482.71,106.07), h = 255.38 },
	  },
	},
	[77] = { type = 'public', coords = vec3(-1868.36,192.09,84.29), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1874.17,194.45,83.77), h = 126.46 },
	  },
	},
	[78] = { type = 'public', coords = vec3(-1899.62,241.7,86.26), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1904.45,242.14,85.6), h = 27.89 },
	  },
	},
	[79] = { type = 'public', coords = vec3(-1918.91,285.25,89.07), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1925.28,283.01,88.23), h = 182.84 },
	  },
	},
	[80] = { type = 'public', coords = vec3(-1935.69,366.09,93.82), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1940.58,360.31,92.55), h = 160.68 },
	  },
	},
	[81] = { type = 'public', coords = vec3(-1938.82,386.17,96.5), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1943.95,385.19,95.6), h = 96.89 },
	  },
	},
	[82] = { type = 'public', coords = vec3(-1937.7,529.39,110.73), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1944.07,521.99,108.31), h = 71.0 },
	  },
	},
	[83] = { type = 'public', coords = vec3(-1977.58,624.88,122.53), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1971.35,620.69,121.14), h = 246.1 },
	  },
	},
	[84] = { type = 'public', coords = vec3(-165.4,919.61,235.65), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-162.36,926.68,234.8), h = 234.16 },
	  },
	},
	[85] = { type = 'public', coords = vec3(-172.67,966.12,237.53), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-167.03,970.73,235.79), h = 316.56 },
	  },
	},
	[86] = { type = 'public', coords = vec3(-124.76,1010.75,235.73), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-127.89,1001.16,234.88), h = 198.68 },
	  },
	},
	[87] = { type = 'public', coords = vec3(-101.17,823.95,235.72), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-105.63,832.61,234.86), h = 10.25 },
	  },
	},
	[88] = { type = 'public', coords = vec3(220.71,755.29,204.85), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(215.84,759.38,203.83), h = 47.56 },
	  },
	},
	[89] = { type = 'public', coords = vec3(100.21,563.99,182.94), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(93.13,575.77,182.13), h = 86.85 },
	  },
	},
	[90] = { type = 'public', coords = vec3(52.84,559.77,180.21), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(53.19,563.71,179.54), h = 21.7 },
	  },
	},
	[91] = { type = 'public', coords = vec3(-143.65,593.14,203.9), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-142.21,597.23,203.12), h = 358.34 },
	  },
	},
	[92] = { type = 'public', coords = vec3(-196.6,621.58,197.91), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-199.24,615.31,196.21), h = 178.98 },
	  },
	},
	[93] = { type = 'public', coords = vec3(-174.92,590.04,197.63), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-178.23,587.21,197.03), h = 359.63 },
	  },
	},
	[94] = { type = 'public', coords = vec3(-224.87,588.93,190.02), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-221.77,593.25,189.61), h = 331.22 },
	  },
	},
	[95] = { type = 'public', coords = vec3(-271.65,599.1,181.68), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-272.26,603.6,181.15), h = 346.6 },
	  },
	},
	[96] = { type = 'public', coords = vec3(-241.91,614.9,187.77), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-244.12,610.79,186.09), h = 149.22 },
	  },
	},
	[97] = { type = 'public', coords = vec3(-338.28,630.36,172.35), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-343.97,634.83,171.43), h = 52.04 },
	  },
	},
	[98] = { type = 'public', coords = vec3(312.7,566.57,154.53), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(316.29,568.06,153.55), h = 220.69 },
	  },
	},
	[99] = { type = 'public', coords = vec3(315.32,493.62,153.14), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(321.07,494.12,151.61), h = 283.1 },
	  },
	},
	[100] = { type = 'public', coords = vec3(326.54,481.25,151.26), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(330.37,482.12,149.86), h = 195.82 },
	  },
	},
	[101] = { type = 'public', coords = vec3(238.09,526.58,140.58), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(236.21,536.62,139.88), h = 114.71 },
	  },
	},
	[102] = { type = 'public', coords = vec3(1290.05,-585.69,71.75), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1295.49,-567.62,71.49), h = 344.65 },
	  },
	},
	[103] = { type = 'public', coords = vec3(1311.03,-593.07,72.93), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1319.19,-575.18,73.25), h = 336.97 },
	  },
	},
	[104] = { type = 'public', coords = vec3(1344.65,-609.86,74.36), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1348.97,-603.76,74.64), h = 334.73 },
	  },
	},
	[105] = { type = 'public', coords = vec3(1359.91,-620.48,74.34), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1360.55,-601.83,74.62), h = 359.42 },
	  },
	},
	[106] = { type = 'public', coords = vec3(1392.87,-607.72,74.35), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1378.33,-596.21,74.61), h = 52.88 },
	  },
	},
	[107] = { type = 'public', coords = vec3(1404.84,-570.68,74.35), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1387.73,-577.37,74.62), h = 113.2 },
	  },
	},
	[108] = { type = 'public', coords = vec3(1366.95,-544.46,74.34), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1363.05,-551.94,74.62), h = 157.25 },
	  },
	},
	[109] = { type = 'public', coords = vec3(1360.66,-536.8,73.78), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1352.89,-553.3,74.31), h = 156.76 },
	  },
	},
	[110] = { type = 'public', coords = vec3(1322.0,-524.9,72.13), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1318.24,-532.96,72.35), h = 160.86 },
	  },
	},
	[111] = { type = 'public', coords = vec3(1314.79,-516.59,71.41), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1307.96,-533.58,71.56), h = 160.38 },
	  },
	},
	[112] = { type = 'public', coords = vec3(1245.08,-518.7,69.0), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1247.17,-522.7,69.25), h = 257.36 },
	  },
	},
	[113] = { type = 'public', coords = vec3(1251.25,-490.29,69.5), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1260.63,-494.22,69.59), h = 255.66 },
	  },
	},
	[114] = { type = 'public', coords = vec3(1259.55,-477.81,70.19), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1280.06,-472.81,69.24), h = 170.02 },
	  },
	},
	[115] = { type = 'public', coords = vec3(1268.56,-461.81,69.84), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1270.98,-463.9,69.87), h = 328.18 },
	  },
	},
	[116] = { type = 'public', coords = vec3(1261.12,-426.7,69.81), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1261.45,-419.35,69.58), h = 297.04 },
	  },
	},
	[117] = { type = 'public', coords = vec3(1234.75,-578.25,69.49), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1243.86,-579.36,69.64), h = 271.53 },
	  },
	},
	[118] = { type = 'public', coords = vec3(1236.79,-589.55,69.79), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1242.92,-586.85,69.55), h = 269.57 },
	  },
	},
	[119] = { type = 'public', coords = vec3(1250.47,-626.17,69.35), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1259.06,-624.91,69.58), h = 296.96 },
	  },
	},
	[120] = { type = 'public', coords = vec3(1257.67,-660.38,67.93), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1271.84,-659.12,68.0), h = 293.69 },
	  },
	},
	[121] = { type = 'public', coords = vec3(1267.25,-673.65,65.75), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1276.75,-673.42,66.25), h = 277.48 },
	  },
	},
	[122] = { type = 'public', coords = vec3(1259.79,-711.08,64.72), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1263.72,-716.66,64.75), h = 239.07 },
	  },
	},
	[123] = { type = 'public', coords = vec3(1225.19,-723.04,60.64), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1223.46,-730.21,60.4), h = 163.48 },
	  },
	},
	[124] = { type = 'public', coords = vec3(1228.5,-703.47,60.68), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1217.85,-704.09,60.7), h = 97.24 },
	  },
	},
	[125] = { type = 'public', coords = vec3(1220.91,-664.18,63.13), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1214.36,-665.12,62.85), h = 103.07 },
	  },
	},
	[126] = { type = 'public', coords = vec3(1206.75,-614.0,66.12), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1199.98,-612.47,65.36), h = 94.4 },
	  },
	},
	[127] = { type = 'public', coords = vec3(1192.48,-597.08,64.01), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1188.28,-595.06,64.23), h = 34.45 },
	  },
	},
	[128] = { type = 'public', coords = vec3(1189.79,-573.78,64.32), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1185.82,-569.96,64.56), h = 25.68 },
	  },
	},
	[129] = { type = 'public', coords = vec3(1191.61,-554.97,64.71), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1187.47,-550.38,64.83), h = 86.85 },
	  },
	},
	[130] = { type = 'public', coords = vec3(1089.59,-495.42,65.07), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1084.78,-493.34,64.4), h = 79.01 },
	  },
	},
	[131] = { type = 'public', coords = vec3(1101.7,-468.42,67.06), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1091.28,-470.87,65.47), h = 77.7 },
	  },
	},
	[132] = { type = 'public', coords = vec3(1111.03,-417.0,67.16), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1111.15,-419.57,67.43), h = 83.31 },
	  },
	},
	[133] = { type = 'public', coords = vec3(1112.77,-394.29,68.74), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1106.07,-399.24,68.2), h = 78.01 },
	  },
	},
	[134] = { type = 'public', coords = vec3(1057.42,-384.09,67.86), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1056.9,-388.45,68.09), h = 221.13 },
	  },
	},
	[135] = { type = 'public', coords = vec3(1021.13,-414.33,65.95), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1022.37,-419.52,66.05), h = 219.15 },
	  },
	},
	[136] = { type = 'public', coords = vec3(1009.82,-418.88,64.96), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1015.92,-423.87,65.32), h = 217.1 },
	  },
	},
	[137] = { type = 'public', coords = vec3(987.71,-438.07,63.75), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(995.76,-435.43,64.23), h = 271.01 },
	  },
	},
	[138] = { type = 'public', coords = vec3(971.53,-447.94,62.41), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(975.54,-454.41,62.86), h = 213.74 },
	  },
	},
	[139] = { type = 'public', coords = vec3(939.3,-463.22,61.26), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(942.05,-469.79,61.53), h = 212.33 },
	  },
	},
	[140] = { type = 'public', coords = vec3(928.77,-475.65,60.7), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(933.31,-480.49,60.88), h = 203.27 },
	  },
	},
	[141] = { type = 'public', coords = vec3(909.42,-489.73,59.02), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(914.46,-490.17,59.29), h = 204.27 },
	  },
	},
	[142] = { type = 'public', coords = vec3(873.98,-503.77,57.5), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(874.77,-507.45,57.72), h = 226.29 },
	  },
	},
	[143] = { type = 'public', coords = vec3(854.95,-516.17,57.33), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(858.81,-522.39,57.59), h = 227.66 },
	  },
	},
	[144] = { type = 'public', coords = vec3(848.57,-540.12,57.33), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(853.51,-542.76,57.6), h = 266.06 },
	  },
	},
	[145] = { type = 'public', coords = vec3(842.1,-567.41,57.71), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(849.29,-567.47,57.99), h = 279.71 },
	  },
	},
	[146] = { type = 'public', coords = vec3(868.47,-594.02,58.3), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(872.86,-590.11,58.28), h = 317.23 },
	  },
	},
	[147] = { type = 'public', coords = vec3(875.58,-602.34,58.45), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(875.55,-598.36,58.45), h = 316.61 },
	  },
	},
	[148] = { type = 'public', coords = vec3(912.15,-631.81,58.05), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(917.67,-627.46,58.32), h = 319.36 },
	  },
	},
	[149] = { type = 'public', coords = vec3(913.03,-645.12,57.87), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(917.96,-639.77,58.14), h = 318.18 },
	  },
	},
	[150] = { type = 'public', coords = vec3(946.14,-657.5,58.02), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(951.67,-654.13,58.16), h = 309.34 },
	  },
	},
	[151] = { type = 'public', coords = vec3(940.18,-672.19,58.02), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(946.99,-669.22,58.29), h = 297.96 },
	  },
	},
	[152] = { type = 'public', coords = vec3(969.7,-688.32,57.95), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(973.59,-685.58,57.91), h = 309.99 },
	  },
	},
	[153] = { type = 'public', coords = vec3(976.24,-713.97,57.87), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(982.5,-709.42,57.88), h = 312.02 },
	  },
	},
	[154] = { type = 'public', coords = vec3(1004.32,-734.1,57.46), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1008.02,-731.13,57.88), h = 311.05 },
	  },
	},
	[155] = { type = 'public', coords = vec3(981.21,-614.8,58.84), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(973.52,-619.61,59.1), h = 128.1 },
	  },
	},
	[156] = { type = 'public', coords = vec3(959.79,-601.7,59.5), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(955.45,-598.08,59.65), h = 27.96 },
	  },
	},
	[157] = { type = 'public', coords = vec3(984.25,-579.14,59.28), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(982.93,-572.6,59.53), h = 31.32 },
	  },
	},
	[158] = { type = 'public', coords = vec3(1008.54,-565.15,60.2), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1012.51,-563.56,60.44), h = 263.72 },
	  },
	},
	[159] = { type = 'public', coords = vec3(943.81,-243.89,68.63), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(939.22,-250.12,68.69), h = 150.37 },
	  },
	},
	[160] = { type = 'public', coords = vec3(1003.79,-588.12,59.14), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1009.07,-590.25,59.2), h = 258.95 },
	  },
	},
	[161] = { type = 'public', coords = vec3(922.71,-564.06,57.97), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(926.46,-567.39,58.24), h = 206.14 },
	  },
	},
	[162] = { type = 'public', coords = vec3(956.87,-546.73,59.53), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(957.91,-552.49,59.55), h = 211.12 },
	  },
	},
	[163] = { type = 'public', coords = vec3(981.96,-530.0,60.12), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(983.27,-536.41,60.19), h = 211.11 },
	  },
	},
	[164] = { type = 'public', coords = vec3(1001.36,-510.47,60.7), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1003.89,-518.48,60.98), h = 205.24 },
	  },
	},
	[165] = { type = 'public', coords = vec3(1045.95,-495.92,64.08), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1049.91,-488.79,64.19), h = 257.03 },
	  },
	},
	[166] = { type = 'public', coords = vec3(1049.12,-479.89,64.1), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1056.64,-483.32,64.11), h = 257.85 },
	  },
	},
	[167] = { type = 'public', coords = vec3(1055.36,-445.56,65.97), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1062.56,-445.67,66.16), h = 257.58 },
	  },
	},
	[168] = { type = 'public', coords = vec3(1020.06,-464.4,63.9), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1019.04,-459.29,64.37), h = 38.05 },
	  },
	},
	[169] = { type = 'public', coords = vec3(966.19,-505.37,61.74), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(960.86,-500.52,61.65), h = 29.8 },
	  },
	},
	[170] = { type = 'public', coords = vec3(950.42,-516.97,60.25), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(948.5,-511.66,60.5), h = 29.22 },
	  },
	},
	[171] = { type = 'public', coords = vec3(921.11,-527.47,59.58), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(915.83,-522.63,59.03), h = 25.35 },
	  },
	},
	[172] = { type = 'public', coords = vec3(893.88,-547.44,58.17), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(888.36,-551.92,58.24), h = 115.0 },
	  },
	},
	[173] = { type = 'public', coords = vec3(1103.28,-429.62,67.4), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1097.86,-428.24,66.68), h = 80.97 },
	  },
	},
	[174] = { type = 'public', coords = vec3(102.82,-1959.78,20.84), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(104.57,-1954.94,20.95), h = 355.58 },
	  },
	},
	[175] = { type = 'public', coords = vec3(-1065.91,-848.05,5.05), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1061.97,-852.79,4.87), h = 249.25 },
		[2] = { vec3(-1058.02,-851.82,4.87), h = 249.25 },
		[3] = { vec3(-1055.48,-849.18,4.87), h = 249.25 },
	  },
	},
	[176] = { type = 'public', coords = vec3(14.13,-1886.93,23.24), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(18.48,-1880.11,23.28), h = 320.5 },
	  },
	},
	[177] = { type = 'public', coords = vec3(98.75,-1907.55,21.07), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(89.81,-1917.18,20.98), h = 140.59 },
	  },
	},
	[178] = { type = 'public', coords = vec3(101.95,-1883.62,24.02), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(105.76,-1879.36,24.22), h = 319.71 },
	  },
	},
	[179] = { type = 'public', coords = vec3(157.6,-1901.16,23.0), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(162.82,-1899.28,23.26), h = 334.81 },
	  },
	},
	[180] = { type = 'public', coords = vec3(163.9,-1954.67,19.32), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(165.73,-1959.08,19.43), h = 227.78 },
	  },
	},
	[181] = { type = 'public', coords = vec3(152.53,-1960.61,19.08), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(152.79,-1965.88,19.04), h = 228.5 },
	  },
	},
	[182] = { type = 'public', coords = vec3(58.69,-1878.41,22.39), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(52.14,-1878.42,22.53), h = 136.83 },
	  },
	},
	[183] = { type = 'public', coords = vec3(45.4,-1849.13,22.84), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(41.44,-1853.34,23.11), h = 135.2 },
	  },
	},
	[184] = { type = 'public', coords = vec3(-45.22,-1791.79,27.45), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-53.0,-1801.42,27.36), h = 50.04 },
	  },
	},
	[185] = { type = 'public', coords = vec3(-54.09,-1781.86,27.88), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-57.67,-1785.85,28.12), h = 136.73 },
	  },
	},
	[186] = { type = 'service', coords = vec3(809.74, -991.4, 26.5), perm = 'mecanico.permissao',
	  vehiclePositions = {
		[1] = { vec3(825.3, -982.15, 26.5), h = 167.87 },
	  },
	  vehicles = {
		
		{ vehicle = 'flatbed3', modelo = 'flatbed3' },
		
	  }
	},
	[187] = { type = 'public', coords = vec3(189.37,-1872.27,24.73), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(186.58,-1877.13,24.85), h = 154.49 },
	  },
	},
	[188] = { type = 'public', coords = vec3(248.21,-1732.71,29.38), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(244.51,-1728.83,29.5), h = 49.0 },
	  },
	},
	[189] = { type = 'public', coords = vec3(272.34,-1704.01,29.31), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(268.09,-1700.73,29.57), h = 49.31 },
	  },
	},
	[190] = { type = 'public', coords = vec3(291.46,-1783.92,28.26), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(297.45,-1791.53,28.19), h = 228.58 },
	  },
	},
	[191] = { type = 'public', coords = vec3(319.33,-1769.51,29.08), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(321.52,-1773.31,28.93), h = 229.23 },
	  },
	},
	[192] = { type = 'public', coords = vec3(142.93,-1832.74,27.07), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(138.97,-1830.69,27.29), h = 49.32 },
	  },
	},
	[193] = { type = 'public', coords = vec3(83.64,-1973.9,20.93), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(87.72,-1968.8,21.03), h = 319.25 },
	  },
	},
	[194] = { type = 'public', coords = vec3(80.39,-1949.55,20.8), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(89.19,-1934.65,20.91), h = 217.76 },
	  },
	},
	[195] = { type = 'public', coords = vec3(54.53,-1921.05,21.66), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(62.29,-1910.55,21.78), h = 230.76 },
	  },
	},
	[196] = { type = 'public', coords = vec3(37.3,-1926.34,21.8), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(42.47,-1920.65,21.94), h = 320.78 },
	  },
	},
	[197] = { type = 'public', coords = vec3(-10.49,-1883.78,24.15), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(0.4,-1878.23,23.07), h = 319.84 },
	  },
	},
	[198] = { type = 'public', coords = vec3(7.46,-1884.39,23.32), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(15.62,-1871.47,23.56), h = 228.24 },
	  },
	},
	[199] = { type = 'public', coords = vec3(-23.09,-1857.7,25.04), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-22.28,-1852.32,25.35), h = 318.16 },
	  },
	},
	[200] = { type = 'public', coords = vec3(-33.91,-1855.64,26.01), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-36.14,-1861.29,26.03), h = 318.25 },
	  },
	},
	[201] = { type = 'public', coords = vec3(123.49,-1927.1,21.01), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(118.66,-1940.02,20.95), h = 86.06 },
	  },
	},
	[202] = { type = 'public', coords = vec3(116.48,-1918.75,20.94), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(109.49,-1924.84,21.03), h = 159.44 },
	  },
	},
	[203] = { type = 'public', coords = vec3(112.4,-1884.8,23.59), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(125.42,-1877.96,23.98), h = 245.04 },
	  },
	},
	[204] = { type = 'public', coords = vec3(163.74,-1922.7,21.2), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(166.25,-1929.66,21.29), h = 230.07 },
	  },
	},
	[205] = { type = 'public', coords = vec3(142.93,-1970.81,18.86), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(153.95,-1978.59,18.55), h = 139.63 },
	  },
	},
	[206] = { type = 'public', coords = vec3(28.49,-1852.1,23.68), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(20.42,-1863.32,23.63), h = 50.07 },
	  },
	},
	[207] = { type = 'public', coords = vec3(11.84,-1843.19,24.53), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(8.43,-1845.9,24.64), h = 139.44 },
	  },
	},
	[208] = { type = 'public', coords = vec3(1196.49, -3105.6, 6.03), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1189.62, -3105.09, 5.71), h = 155.81 },
	  },
	},
	[209] = { type = 'public', coords = vec3(206.99,-1892.89,24.43), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(198.9,-1897.55,24.5), h = 142.92 },
	  },
	},
	[210] = { type = 'public', coords = vec3(302.56,-1777.35,29.1), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(312.42,-1785.76,28.42), h = 229.27 },
	  },
	},
	[211] = { type = 'public', coords = vec3(289.96,-1789.91,27.7), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(297.45,-1791.53,28.19), h = 228.58 },
	  },
	},
	[212] = { type = 'public', coords = vec3(311.04,-1735.44,29.54), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(315.43,-1739.08,29.73), h = 231.04 },
	  },
	},
	[213] = { type = 'public', coords = vec3(269.11,-1728.64,29.65), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(264.26,-1718.68,29.56), h = 49.25 },
	  },
	},
	[214] = { type = 'public', coords = vec3(269.79,-1710.52,29.34), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(257.55,-1701.71,29.31), h = 320.02 },
	  },
	},
	[215] = { type = 'public', coords = vec3(248.94,-1936.94,24.35), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(240.16,-1927.99,24.39), h = 319.7 },
	  },
	},
	[216] = { type = 'public', coords = vec3(269.8,-1932.86,25.44), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(263.07,-1921.28,25.41), h = 54.74 },
	  },
	},
	[217] = { type = 'public', coords = vec3(-1531.67, 851.23, 181.59), perm = nil,  --mafia
	  vehiclePositions = {
		[1] = { vec3(-1543.19, 857.66, 181.49), h = 51.02 },
	  },
	},
	[218] = { type = 'public', coords = vec3(279.17,-1899.45,26.89), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(269.73,-1892.82,26.83), h = 319.63 },
	  },
	},
	[219] = { type = 'public', coords = vec3(318.07,-1856.29,27.11), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(305.2,-1850.27,27.0), h = 320.21 },
	  },
	},
	[220] = { type = 'public', coords = vec3(340.81,-1849.98,27.77), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(335.81,-1835.98,27.61), h = 44.87 },
	  },
	},
	[221] = { type = 'public', coords = vec3(344.21,-1828.31,27.95), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(333.16,-1817.23,27.99), h = 320.18 },
	  },
	},
	[222] = { type = 'public', coords = vec3(350.15,-1811.51,28.8), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(342.37,-1806.23,28.48), h = 319.97 },
	  },
	},
	[223] = { type = 'public', coords = vec3(404.54,-1753.91,29.37), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(403.61,-1739.39,29.54), h = 46.7 },
	  },
	},
	[224] = { type = 'public', coords = vec3(430.66,-1741.22,29.61), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(431.33,-1735.54,28.65), h = 50.2 },
	  },
	},
	[225] = { type = 'public', coords = vec3(434.96,-1715.43,29.33), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(430.06,-1715.87,28.69), h = 49.34 },
	  },
	},
	[226] = { type = 'public', coords = vec3(442.86,-1698.41,29.38), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(442.78,-1693.12,28.66), h = 51.33 },
	  },
	},
	[227] = { type = 'public', coords = vec3(498.38,-1698.89,29.41), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(498.01,-1702.77,29.64), h = 236.28 },
	  },
	},
	[228] = { type = 'public', coords = vec3(479.02,-1718.03,29.37), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(490.02,-1721.93,29.62), h = 251.19 },
	  },
	},
	[229] = { type = 'public', coords = vec3(464.62,-1740.78,29.11), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(473.8,-1744.08,29.21), h = 250.4 },
	  },
	},
	[230] = { type = 'public', coords = vec3(475.52,-1755.13,28.76), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(488.5,-1757.75,28.71), h = 163.16 },
	  },
	},
	[231] = { type = 'public', coords = vec3(475.02,-1772.84,28.7), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(478.21,-1779.06,28.93), h = 270.19 },
	  },
	},
	[232] = { type = 'public', coords = vec3(511.46,-1778.19,28.51), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(499.79,-1777.14,28.64), h = 201.67 },
	  },
	},
	[233] = { type = 'public', coords = vec3(504.82,-1799.04,28.49), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(500.19,-1792.86,28.65), h = 161.09 },
	  },
	},
	[234] = { type = 'public', coords = vec3(504.77,-1808.65,28.51), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(491.87,-1805.02,28.65), h = 138.92 },
	  },
	},
	[235] = { type = 'public', coords = vec3(487.7,-1826.73,28.53), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(479.28,-1819.72,28.1), h = 139.7 },
	  },
	},
	[236] = { type = 'public', coords = vec3(431.96,-1828.9,28.18), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(437.06,-1837.91,28.21), h = 223.26 },
	  },
	},
	[237] = { type = 'public', coords = vec3(428.72,-1839.65,28.08), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(434.57,-1841.14,28.23), h = 222.18 },
	  },
	},
	[238] = { type = 'public', coords = vec3(401.5,-1849.32,27.32), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(401.08,-1855.1,27.06), h = 223.65 },
	  },
	},
	[239] = { type = 'public', coords = vec3(396.69,-1872.65,26.25), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(397.28,-1877.44,26.35), h = 222.91 },
	  },
	},
	[240] = { type = 'public', coords = vec3(385.03,-1890.77,25.32), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(384.63,-1896.36,25.21), h = 222.83 },
	  },
	},
	[241] = { type = 'public', coords = vec3(360.06,-1894.9,24.99), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(357.8,-1896.77,25.08), h = 227.0 },
	  },
	},
	[242] = { type = 'public', coords = vec3(315.73,-1937.5,24.82), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(315.5,-1942.05,24.92), h = 230.52 },
	  },
	},
	[243] = { type = 'public', coords = vec3(310.66,-1965.91,23.74), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(316.82,-1970.62,23.69), h = 138.57 },
	  },
	},
	[244] = { type = 'public', coords = vec3(299.42,-1971.96,22.49), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(306.82,-1982.39,22.39), h = 139.63 },
	  },
	},
	[245] = { type = 'public', coords = vec3(282.89,-1980.29,21.4), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(285.64,-1985.85,21.41), h = 229.16 },
	  },
	},
	[246] = { type = 'public', coords = vec3(280.83,-1991.24,20.46), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(286.37,-1992.54,20.81), h = 228.61 },
	  },
	},
	[247] = { type = 'public', coords = vec3(256.42,-2026.71,18.86), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(267.58,-2029.38,18.82), h = 142.23 },
	  },
	},
	[248] = { type = 'public', coords = vec3(240.68,-2021.42,18.71), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(246.74,-2035.94,18.53), h = 228.9 },
	  },
	},
	[249] = { type = 'public', coords = vec3(241.9,-2042.78,18.02), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(245.74,-2053.88,18.1), h = 134.18 },
	  },
	},
	[250] = { type = 'public', coords = vec3(-442.95,6202.62,29.56), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-435.4,6206.42,29.57), h = 278.13 },
	  },
	},
	[251] = { type = 'public', coords = vec3(-375.5,6187.37,31.54), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-379.5,6184.85,31.4), h = 223.82 },
	  },
	},
	[252] = { type = 'public', coords = vec3(-361.91,6204.76,31.58), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-367.92,6200.05,31.4), h = 224.98 },
	  },
	},
	[253] = { type = 'public', coords = vec3(-359.1,6227.29,31.5), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-349.5,6217.17,31.4), h = 223.88 },
	  },
	},
	[254] = { type = 'public', coords = vec3(-381.48,6254.9,31.49), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-388.73,6273.42,30.02), h = 50.83 },
	  },
	},
	[255] = { type = 'public', coords = vec3(-360.84,6265.04,31.53), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-352.17,6265.07,31.32), h = 46.14 },
	  },
	},
	[256] = { type = 'public', coords = vec3(-436.46,6264.1,30.09), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-429.99,6260.87,30.31), h = 258.67 },
	  },
	},
	[257] = { type = 'public', coords = vec3(-402.95,6317.15,28.95), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-396.68,6311.99,28.84), h = 220.7 },
	  },
	},
	[258] = { type = 'public', coords = vec3(-364.3,6337.74,29.85), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-360.16,6328.54,29.75), h = 220.61 },
	  },
	},
	[259] = { type = 'public', coords = vec3(-311.14,6310.94,32.48), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-318.17,6317.76,31.77), h = 45.39 },
	  },
	},
	[260] = { type = 'public', coords = vec3(-291.83,6335.9,32.49), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-296.49,6340.57,31.82), h = 46.26 },
	  },
	},
	[261] = { type = 'public', coords = vec3(-272.11,6353.73,32.49), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-267.41,6355.22,32.4), h = 47.15 },
	  },
	},
	[262] = { type = 'public', coords = vec3(-250.27,6355.12,31.5), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-255.08,6360.48,31.39), h = 45.08 },
	  },
	},
	[263] = { type = 'public', coords = vec3(-271.22,6408.91,31.12), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-265.26,6406.49,30.88), h = 210.49 },
	  },
	},
	[264] = { type = 'public', coords = vec3(-217.34,6374.6,31.68), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-219.54,6383.16,31.52), h = 45.87 },
	  },
	},
	[265] = { type = 'public', coords = vec3(-238.3,6423.56,31.46), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-233.04,6420.27,31.16), h = 220.84 },
	  },
	},
	[266] = { type = 'public', coords = vec3(-201.42,6396.75,31.87), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-201.53,6401.82,31.77), h = 46.62 },
	  },
	},
	[267] = { type = 'public', coords = vec3(-229.57,6445.5,31.2), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-224.33,6435.29,31.11), h = 22964 },
	  },
	},
	[268] = { type = 'public', coords = vec3(-187.33,6412.01,31.92), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-187.43,6418.12,31.78), h = 44.99 },
	  },
	},
	[269] = { type = 'public', coords = vec3(-122.88,6561.7,29.53), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-115.59,6567.64,29.43), h = 224.24 },
	  },
	},
	[270] = { type = 'public', coords = vec3(-101.69,6531.68,29.81), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-106.48,6536.09,29.72), h = 45.2 },
	  },
	},
	[271] = { type = 'public', coords = vec3(-37.32,6578.82,32.35), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-40.97,6593.44,30.34), h = 37.22 },
	  },
	},
	[272] = { type = 'public', coords = vec3(-15.06,6566.75,31.91), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-8.44,6561.16,31.88), h = 224.22 },
	  },
	},
	[273] = { type = 'public', coords = vec3(11.48,6578.36,33.08), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(15.78,6583.02,32.35), h = 223.198 },
	  },
	},
	[274] = { type = 'public', coords = vec3(-17.04,6598.51,31.48), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-8.5,6598.24,31.38), h = 39.88 },
	  },
	},
	[275] = { type = 'public', coords = vec3(-43.93,6634.26,30.23), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-52.4,6623.94,29.87), h = 221 },
	  },
	},
	[276] = { type = 'public', coords = vec3(-14.79,6650.52,31.15), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-15.82,6645.42,31.03), h = 208.0 },
	  },
	},
	[277] = { type = 'public', coords = vec3(2.37,6618.26,31.47), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-5.0,6618.68,31.34), h = 60.09 },
	  },
	},
	[278] = { type = 'public', coords = vec3(25.06,6601.97,32.48), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(36.23,6606.74,32.38), h = 267.62 },
	  },
	},
	[279] = { type = 'public', coords = vec3(24.79,6659.22,31.65), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(21.16,6661.48,31.44), h = 182.65 },
	  },
	},
	[280] = { type = 'public', coords = vec3(81.27,6644.04,31.93), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(72.41,6635.25,31.75), h = 142.72 },
	  },
	},
	[281] = { type = 'public', coords = vec3(313.33,-1465.13,46.5), perm = 'helivip.permissao',
	  vehiclePositions = {
		[1] = { vec3(313.33,-1465.13,46.5), h = 31.63 },
	  },
	},
	[282] = { type = 'service', coords = vec3(0,0,0), perm = 'policia.permissao',
	  vehiclePositions = {
		[1] = { vec3(-965.78,-2104.56,9.6), h = 31.63 },
	  },
	  vehicles = {
		{ vehicle = 'xtbaep', modelo = 'xtbaep' },
		{ vehicle = 'trailbaep4', modelo = 'trailbaep4' },  
	  }
	},
	[283] = { type = 'service', coords = vec3(0,0,0), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-571.38, 330.62, 84.53), h = 264.95 },
	},
	vehicles = {
	  { vehicle = 'pounder', modelo = 'Caminhão' },  
	}
  },
	[284] = { type = 'service', coords = vec3(-1107.17,-832.54,37.69), perm = 'policia.permissao',
	  vehiclePositions = {
		[1] = { vec3(-1096.19,-832.18,38.02), h = 304.49 },
	  },
	  vehicles = {
		{ vehicle = 'WRpolmav', modelo = 'WRpolmav' },  
	  }
	},
	[285] = { type = 'public', coords = vec3(-3200.66,829.75,8.94), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-3199.48,837.03,8.94), h = 57.53 },
		[2] = { vec3(-3202.82,844.16,8.94), h = 59.41 },
	  },
	},
	[286] = { type = 'service', coords = vec3(0,0,0), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(741.02,134.64,80.49), h = 86.94 },
	  },
	  vehicles = {
		{ vehicle = 'asea', modelo = 'asea' },  
	  }
	},
	[287] = { type = 'public', coords = vec3(1035.96,-763.44,57.99), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1017.89,-760.37,57.98), h = 215.63 },
		[2] = { vec3(1015.22,-762.92,57.9), h = 215.63 },
		[3] = { vec3(1021.23,-758.44,57.98), h = 215.63 },
		[4] = { vec3(1023.57,-755.56,57.9), h = 215.63 },
	  },
	},
	[288] = { type = 'public', coords = vec3(140.35,-1866.11,24.32), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(136.94,-1869.3,24.4), h = 155.02 },
	  },
	},
	[289] = { type = 'public', coords = vec3(72.16,-1935.47,20.99), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(81.72,-1932.41,21.02), h = 316.63 },
	  },
	},

	[290] = { type = 'service', coords = vec3(0,0,0), perm = 'vanilla.permissao',
	  vehiclePositions = {
		[1] = { vec3(134.09, -1308.75, 28.94), h = 121.255},
	  },
	  vehicles = {
		{ vehicle = 'vanillavan', modelo = 'vanillavan' }, 
	  }
	},
	[291] = { type = 'service', coords = vec3(0,0,0), perm = 'bahamas.permissao',
	  vehiclePositions = {
		[1] = { vec3(-1395.07, -582.72, 30.17), h = 31.63 },
	  },
	  vehicles = {
		{ vehicle = 'bahamasvan', modelo = 'bahamasvan' },  
	  }
	},
	[292] = { type = 'service', coords = vec3(0,0,0), perm = 'azul.permissao',
	  vehiclePositions = {
		[1] = { vec3(-1117.14, -1733.33, 4.18), h = 31.63 },
	  },
	  vehicles = {
		{ vehicle = 'azulvan', modelo = 'azulvan' }, 
	  }
	},
	[293] = { type = 'service', coords = vec3(0,0,0), perm = 'cinza.permissao',
	  vehiclePositions = {
		[1] = { vec3(1377.65, -738.53, 67.24), h = 31.63 },
	  },
	  vehicles = {
		{ vehicle = 'cinzavan', modelo = 'cinzavan' },  
	  }
	},
	[294] = { type = 'service', coords = vec3(0,0,0), perm = 'laranjas.permissao',
	  vehiclePositions = {
		[1] = { vec3(1920.96, -985.62, 79.13), h = 31.63 },
	  },
	  vehicles = {
		{ vehicle = 'laranjavan', modelo = 'laranjavan' }, 
	  }
	},
	[295] = { type = 'service', coords = vec3(0,0,0), perm = 'verdes.permissao',
	  vehiclePositions = {
		[1] = { vec3(-2586.16, 2877.19, 4.39), h = 72.45 },
	  },
	  vehicles = {
		{ vehicle = 'verdesvan', modelo = 'verdesvan' }, 
	  }
	},
	[296] = { type = 'service', coords = vec3(0,0,06), perm = 'vermelho.permissao',
	  vehiclePositions = {
		[1] = { vec3(1278.23, -209.86, 100.06), h = 31.63 },
	  },
	  vehicles = {
		{ vehicle = 'vermelhosvan', modelo = 'vermelhosvan' },  
	  }
	},
	[297] = { type = 'service', coords = vec3(0,0,0), perm = 'bombeiro.permissao',
	vehiclePositions = {
	  [1] = { vec3(353.02, -634.14, 29.07), h = 308.39 },
	},
	vehicles = {
	  { vehicle = 'firetruk', modelo = 'firetruk' },  
	}
  },
	[298] = { type = 'service', coords = vec3(0,0,0), perm = nil,
	vehiclePositions = {
		[1] = { vec3(1204.76, -1267.59, 35.23), h = 173.13 },
	},
	vehicles = {
		{ vehicle = 'ratloader', modelo = 'ratloader' },  
	}
	},
	[299] = { type = 'service', coords = vec3(0,0,0), perm = nil,
	vehiclePositions = {
		[1] = { vec3(434.05, 6492.83, 29.13), h = 209.54 },
		[2] = { vec3(439.62, 6492.88, 29.33), h = 209.54 },
	},
	vehicles = {
		{ vehicle = 'rebel', modelo = 'rebel' },  
	}
	},
	[300] = { type = 'service', coords = vec3(0,0,0), perm = nil,
	vehiclePositions = {
		[1] = { vec3(440.09, 6478.5, 29.27), h = 310.31 },
		[2] = { vec3(443.69, 6475.29, 29.4), h = 310.31 },
	},
	vehicles = {
		{ vehicle = 'tractor2', modelo = 'tractor2' },  
	}
	},
	 
	[301] = { type = 'service', coords = vec3(-539.71, -887.72, 25.15), perm = 'news.permissao',
	  vehiclePositions = {
		[1] = { vec3(-549.48, -898.75, 24.19), h = 31.63 },
	  },
	  vehicles = {
		{ vehicle = 'newsmav', modelo = 'newsmav' },
		{ vehicle = 'rumpo', modelo = 'rumpo' },   
	  },
	},
	
	
}
-----------------------------------------------------------------
-----------------------------------------------------------------
-----------------------------------------------------------------



-----------------------------------------------------------------
------------------ GARAGENS DAS CASAS ---------------------------
-----------------------------------------------------------------

config.homeGarages = {
	[1] = { type = 'home', coords = vec3(-790.19,307.91,85.7),
	  vehiclePositions = {
		[1] = { vec3(-796.85,306.13,85.7), h = 276.73 },
	  },
	  home = 'Bulbasaur'
	},
	[2] = { type = 'home', coords = vec3(-1299.77,-408.84,35.78),
	  vehiclePositions = {
		[1] = { vec3(-1297.82,-404.77,35.97), h = 106.56 },
	  },
	  home = 'Venusaur'
	},
	[3] = { type = 'home', coords = vec3(-36.4,-570.3,38.83),
	  vehiclePositions = {
		[1] = { vec3(-28.06,-567.57,37.74), h = 198.88 },
	  },
	  home = 'Charmeleon'
	},
	[4] = { type = 'home', coords = vec3(-466.88,-677.66,32.71),
	  vehiclePositions = {
		[1] = { vec3(-466.29,-667.67,32.29), h = 272.0 },
	  },
	  home = 'Charizard'
	},
	[5] = { type = 'home', coords = vec3(-1459.64,-506.13,32.08),
	  vehiclePositions = {
		[1] = { vec3(-1458.86,-499.95,32.45), h = 22.44 },
	  },
	  home = 'Squirtle'
	},
	[6] = { type = 'home', coords = vec3(-1001.52,-785.17,16.37),
	  vehiclePositions = {
		[1] = { vec3(-1009.59,-783.21,16.37), h = 240.21 },
	  },
	  home = 'Wartortle'
	},
	[7] = { type = 'home', coords = vec3(-873.04,-377.15,39.39),
	  vehiclePositions = {
		[1] = { vec3(-868.11,-376.61,39.33), h = 207.33 },
	  },
	  home = 'Blastoise'
	},
	[8] = { type = 'home', coords = vec3(-630.97,52.76,43.72),
	  vehiclePositions = {
		[1] = { vec3(-636.74,55.61,43.65), h = 80.22 },
	  },
	  home = 'Caterpie'
	},
	[9] = { type = 'home', coords = vec3(-303.86,225.71,87.94),
	  vehiclePositions = {
		[1] = { vec3(-300.55,232.42,88.19), h = 295.26 },
	  },
	  home = 'Metapod'
	},
	[10] = { type = 'home', coords = vec3(-33.91,-1855.64,26.01),
	  vehiclePositions = {
		[1] = { vec3(-36.14,-1861.29,26.03), h = 318.25 },
	  },
	  home = 'Butterfree'
	},
	[11] = { type = 'home', coords = vec3(-23.09,-1857.7,25.04),
	  vehiclePositions = {
		[1] = { vec3(-22.28,-1852.32,25.35), h = 318.16 },
	  },
	  home = 'Weedle'
	},
	[12] = { type = 'home', coords = vec3(-10.49,-1883.78,24.15),
	  vehiclePositions = {
		[1] = { vec3(0.4,-1878.23,23.07), h = 319.84 },
	  },
	  home = 'Kakuna'
	},
	[13] = { type = 'home', coords = vec3(14.13,-1886.93,23.24),
	  vehiclePositions = {
		[1] = { vec3(18.48,-1880.11,23.28), h = 320.5 },
	  },
	  home = 'Nidoking'
	},
	[14] = { type = 'home', coords = vec3(37.3,-1926.34,21.8),
	  vehiclePositions = {
		[1] = { vec3(42.47,-1920.65,21.94), h = 320.78 },
	  },
	  home = 'Pidgey'
	},
	[15] = { type = 'home', coords = vec3(54.53,-1921.05,21.66),
	  vehiclePositions = {
		[1] = { vec3(62.29,-1910.55,21.78), h = 230.76 },
	  },
	  home = 'Pidgeotto'
	},
	[16] = { type = 'home', coords = vec3(72.16,-1935.47,20.99),
	  vehiclePositions = {
		[1] = { vec3(81.72,-1932.41,21.02), h = 316.63 },
	  },
	  home = 'Pidgeot'
	},
	[17] = { type = 'home', coords = vec3(80.39,-1949.55,20.8),
	  vehiclePositions = {
		[1] = { vec3(89.19,-1934.65,20.91), h = 217.76 },
	  },
	  home = 'Rattata'
	},
	[18] = { type = 'home', coords = vec3(83.64,-1973.9,20.93),
	  vehiclePositions = {
		[1] = { vec3(87.72,-1968.8,21.03), h = 319.25 },
	  },
	  home = 'Raticate'
	},
	[19] = { type = 'home', coords = vec3(102.82,-1959.78,20.84),
	  vehiclePositions = {
		[1] = { vec3(104.57,-1954.94,20.95), h = 355.58 },
	  },
	  home = 'Spearow'
	},
	[20] = { type = 'home', coords = vec3(152.53,-1960.61,19.08),
	  vehiclePositions = {
		[1] = { vec3(152.79,-1965.88,19.04), h = 228.5 },
	  },
	  home = 'Ekans'
	},
	[21] = { type = 'home', coords = vec3(163.9,-1954.67,19.32),
	  vehiclePositions = {
		[1] = { vec3(165.73,-1959.08,19.43), h = 227.78 },
	  },
	  home = 'Arbok'
	},
	[22] = { type = 'home', coords = vec3(163.74,-1922.7,21.2),
	  vehiclePositions = {
		[1] = { vec3(166.25,-1929.66,21.29), h = 230.07 },
	  },
	  home = 'Pikachu'
	},
	[23] = { type = 'home', coords = vec3(157.6,-1901.16,23.0),
	  vehiclePositions = {
		[1] = { vec3(162.82,-1899.28,23.26), h = 334.81 },
	  },
	  home = 'Raichu'
	},
	[24] = { type = 'home', coords = vec3(123.49,-1927.1,21.01),
	  vehiclePositions = {
		[1] = { vec3(118.66,-1940.02,20.95), h = 86.06 },
	  },
	  home = 'Sandshrew'
	},
	[25] = { type = 'home', coords = vec3(123.49,-1927.1,21.01),
	  vehiclePositions = {
		[1] = { vec3(118.66,-1940.02,20.95), h = 86.06 },
	  },
	  home = 'Sandslash'
	},
	[26] = { type = 'home', coords = vec3(-186.66,500.53,134.69),
	  vehiclePositions = {
		[1] = { vec3(-190.91,503.63,134.17), h = 100.65 },
	  },
	  home = 'Ninetales'
	},
	[27] = { type = 'home', coords = vec3(350.82,439.37,147.26),
	  vehiclePositions = {
		[1] = { vec3(356.43,439.03,145.71), h = 301.35 },
	  },
	  home = 'Jigglypuff'
	},
	[28] = { type = 'home', coords = vec3(386.86,428.44,144.2),
	  vehiclePositions = {
		[1] = { vec3(391.01,431.31,143.41), h = 351.11 },
	  },
	  home = 'Wigglytuff'
	},
	[29] = { type = 'home', coords = vec3(-685.91,599.57,143.6),
	  vehiclePositions = {
		[1] = { vec3(-685.21,605.2,143.77), h = 313.72 },
	  },
	  home = 'Zubat'
	},
	[30] = { type = 'home', coords = vec3(-753.35,622.41,142.62),
	  vehiclePositions = {
		[1] = { vec3(-751.93,629.3,142.38), h = 14.51 },
	  },
	  home = 'Golbat'
	},
	[31] = { type = 'home', coords = vec3(-861.38,695.74,148.99),
	  vehiclePositions = {
		[1] = { vec3(-863.56,700.96,149.06), h = 1.07 },
	  },
	  home = 'Oddish'
	},
	[32] = { type = 'home', coords = vec3(129.09,567.02,183.56),
	  vehiclePositions = {
		[1] = { vec3(130.84,569.73,183.35), h = 351.06 },
	  },
	  home = 'Gloom'
	},
	[33] = { type = 'home', coords = vec3(-1319.42,446.5,99.8),
	  vehiclePositions = {
		[1] = { vec3(-1324.42,450.73,99.8), h = 7.4 },
	  },
	  home = 'Vileplume'
	},
	[34] = { type = 'home', coords = vec3(-1503.06,431.14,111.11),
	  vehiclePositions = {
		[1] = { vec3(-1509.8,429.93,111.03), h = 44.45 },
	  },
	  home = 'Machoke'
	},
	[35] = { type = 'home', coords = vec3(-1406.8,536.67,122.93),
	  vehiclePositions = {
		[1] = { vec3(-1410.72,538.91,122.77), h = 95.83 },
	  },
	  home = 'Machamp'
	},
	[36] = { type = 'home', coords = vec3(-1366.15,608.29,133.91),
	  vehiclePositions = {
		[1] = { vec3(-1361.89,605.5,133.9), h = 284.82 },
	  },
	  home = 'Bellsprout'
	},
	[37] = { type = 'home', coords = vec3(-966.43,759.74,175.47),
	  vehiclePositions = {
		[1] = { vec3(-967.32,764.1,175.36), h = 49.93 },
	  },
	  home = 'Weepinbell'
	},
	[38] = { type = 'home', coords = vec3(-461.7,672.54,148.36),
	  vehiclePositions = {
		[1] = { vec3(-465.72,671.94,147.65), h = 152.65 },
	  },
	  home = 'Victreebel'
	},
	[39] = { type = 'home', coords = vec3(-22.88,-1432.0,30.66),
	  vehiclePositions = {
		[1] = { vec3(-23.6,-1437.69,30.65), h = 184.17 },
	  },
	  home = 'Magneton'
	},
	[40] = { type = 'home', coords = vec3(-83.18,-15.25,66.35),
	  vehiclePositions = {
		[1] = { vec3(-80.08,-21.22,66.32), h = 241.5 },
	  },
	  home = 'Farfetch'
	},
}
-----------------------------------------------------------------
-----------------------------------------------------------------



--------------------------------------------------------------------------------
-- função para checar se o player é dono da casa para poder acessar à garagem --
--------------------------------------------------------------------------------
--[[ config.hasHome = function(source,user_id,home)
	local address = vRP.getUserAddress(user_id)
	if address and #address > 0 then
		for i in ipairs(address) do 
			if address[i].home == home then
				return true
			end
		end
	end
	TriggerClientEvent("Notify",source,"negado","Você não tem acesso à essa residência.",3000)
	return false
end ]]

config.hasHome = function(source,user_id,home)
	local address = vRP.query("homes/get_homeuserid",{ user_id = user_id })
	if address and #address > 0 then
		for i in ipairs(address) do 
			if address[i].home == home then
				return true
			end
		end
	end
	TriggerClientEvent("Notify",source,"negado","Você não tem acesso à essa residência.",3000)
	return false
end
  




-- funcao executada sempre que puxar um veiculo

config.payTax = function(source,user_id,vehicle)
	if source and user_id and vehicle then
		local vehInfo = config.getVehicleInfo(vehicle)
		if vehInfo then
			local tipo = vehInfo.tipo
			if (tipo == "exclusive" and vRP.hasPermission(user_id,"naopagaipva.permissao")) or tipo == "rental" then
				TriggerClientEvent("Notify",source,"bom","Veículo <b>Exclusivo (com o vip ativo) ou Alugado</b>, Não será cobrado a taxa de liberação.",10000)
				return true
			elseif tipo ~= "exclusive" then
				local price = vehInfo.price
				local payment = price * 0.005
				if vRP.tryFullPayment(user_id, payment) then
					return true
				else
					TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente",10000)
				end
			end
		end
	end
	return false
end
  

-- funcao executada sempre que abrir a garagem

config.checkOpenGarage = function(source,user_id)
	if vRP.searchReturn(source,user_id) then
		return false
	end
	return true
end
 



 -- funcao de cobrar a taxa de detido / desmanche / ipva

config.checkTax = function(source,user_id,vehicle,type, garage, home)
    local vehicleInfo = vRP.query("vRP/getVehicle", {user_id = user_id, vehicle = vehicle})
    if vehicleInfo and #vehicleInfo > 0 then
        local price = getVehiclePrice(vehicle)
        if vehicleInfo[1].detido == 0 and parseInt(tonumber(vehicleInfo[1].ipva) + 24 * 15 * 60 * 60) > parseInt(os.time()) and not config.getVehicleTax then
            return true
        end
        if vehicleInfo[1].detido == 1 then
            if parseInt(vehicleInfo[1].time) == 0 then
                price = parseInt(price * (config.seguradora / 100))
            else
                price = parseInt(price * (config.detido / 100))
            end
        elseif type and type == "exclusive" then
            vRP.execute("vRP/setIpva", { user_id = user_id, vehicle = vehicle, ipva = parseInt(os.time())})
            return true
        elseif parseInt(tonumber(vehicleInfo[1].ipva) + 24 * 15 * 60 * 60) <= parseInt(os.time()) then
            price = parseInt(price * ((config.ipva or 1) / 100))
        elseif config.getVehicleTax then
            price = config.getVehicleTax(user_id, vehicle, price, home)
        end
        if config.use_tryFullPayment then
            if vRP.tryFullPayment(user_id, price) then
                vRP.execute("vRP/setDetido", { detido = 0, time = "0", user_id = user_id, vehicle = vehicle, ipva = parseInt(os.time())})
                return true
            end
        elseif vRP.tryPayment(user_id, price) then
            vRP.execute("vRP/setDetido", { detido = 0, time = "0", user_id = user_id, vehicle = vehicle, ipva = parseInt(os.time())})
            return true
        end
    elseif garage and garage.type == "service" and config.getRentedVehicleTax then
        local price = config.getRentedVehicleTax(user_id, vehicle, garage)
        if config.use_tryFullPayment then
            if vRP.tryFullPayment(user_id, price) then
                return true
            end
        elseif vRP.tryPayment(user_id, price) then
            return true
        end
    end
    return false
end
 

 
--[[ config.getVehiclePlate = function(source,veh)
    local user_id = vRP.getUserId(source)
	local vehicle = vRP.query("vRP/getVehicle", { user_id = user_id, vehicle = veh })
	if vehicle[1] then
		return vehicle[1].plate
	end
end
 ]]




 -- cobrar por cada vez que puxar um veiculo na garagem

--[[ config.getVehicleTax = function(user_id,vehicle, price)
	local tax = parseInt(price * 0.1)
	-- if tax > 10000 then
	-- 	tax = 10000
	-- end
	return tax
end

config.getRentedVehiclesTax = function(user_id, vehicles, garage)
	for i, veh in ipairs(vehicles) do
		veh.tax = 1000
	end
	return vehicles
end


config.getRentedVehicleTax = function(user_id, vehicle, garage)
	return 1000
end ]]


--[[ config.checkVehicleGarage = function(source,user_id,vehicle, garage)
	return true
end ]]


--[[ config.playAnim = function()
	vRP._playAnim(true,{"anim@mp_player_intmenu@key_fob@","fob_click"},false)
end ]]

--[[ config.checkHealth = function()
	return GetEntityHealth(PlayerPedId()) > 0
end ]]



--[[ config.webhook = ""

config.webhookMessage = function(user_id, hash, placa, coords)
	local message = "ERROR"
	if user_id and hash and placa and coords then	
		local identity = vRP.getUserIdentity(user_id)
		local vname = config.getVehicleModel(hash)
		local x,y,z = table.unpack(coords)
		message = "```prolog\n[PASSAPORTE]: "..user_id.." | "..identity.name.." "..identity.firstname.." \n[USOU]: /dv \n[EM]: "..vname.." | "..placa.." \n[XYZ]: "..x..", "..y..", "..z.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```"
	end
	return message
end
 ]]

config.pt_BR = {
	vehicleOutOfGarage = "Você já tem um veículo deste modelo fora da garagem.",
	allSlotsOccupied = "Todas as vagas estão ocupadas no momento.",
	vehicleUnavailable = "Veículo em falta na cidade!",
	seizedVehicle = "Veículo apreendido.",
	detainedVehicle = "Veículo detido.",
	noPermission = "Você não tem permissao",
	idUnavailable = function(id) return "ID "..id.." não está disponível" end,
	borrowedKey = function(vehicle,id) return "Chave do veículo <b>"..vehicle.."</b> emprestada para o ID <b>"..id.."</b>" end,
	alreadyHasKey = function(id) return "ID "..id.." já possui a chave desse veículo" end,
	removedKey = function(vehicle,id) return "Chave do veículo <b>"..vehicle.."</b> removida do ID <b>"..id.."</b>" end,
	idHasNoKey = function(id) return "ID "..id.." não possui a chave desse veículo" end,
	borrowedKeys = "Chaves emprestadas:",
	keyCommand = "chave",
	keyTutorial = "Utilize /chave <b>(add/remove/list) (veículo) (id)</b>",
	hasNoVehicle = function(vehicle) return "Você não possui o veículo <b>"..vehicle.."</b>" end,
	anchorCommand = "ancorar",
	disabled = "Desativado",
	installed = "Instalado",
	uninstalled = "Desinstalado",
	level = "Level",
	spawningVehicle = "Já existe um veículo sendo retirado."
}

config.en_US = {
	vehicleOutOfGarage = "You already have a vehicle of this model outside the garage.",
	allSlotsOccupied = "All slots are currently occupied.",
	vehicleUnavailable = "Missing vehicle in town!",
	seizedVehicle = "Seized vehicle.",
	detainedVehicle = "Detained vehicle.",
	noPermission = "You do not have permission",
	idUnavailable = function(id) return "ID "..id.." is not available" end,
	borrowedKey = function(vehicle,id) return "Vehicle key <b>"..vehicle.."</b> borrowed for ID <b>"..id.."</b>" end,
	alreadyHasKey = function(id) return "ID "..id.." already has the key to that vehicle" end,
	removedKey = function(vehicle,id) return "Vehicle key <b>"..vehicle.."</b> removed for ID <b>"..id.."</b>" end,
	idHasNoKey = function(id) return "ID "..id.." does not have a vehicle key" end,
	borrowedKeys = "Borrowed keys:",
	keyCommand = "key",
	keyTutorial = "Use /key <b> (add/remove/list) (vehicle) (id) </b>",
	hasNoVehicle = function(vehicle) return "You do not own the vehicle <b> "..vehicle .." </b>" end,
	anchorCommand = "anchor",
	disabled = "Disabled",
	installed = "Installed",
	uninstalled = "Uninstalled",
	level = "Level",
	spawningVehicle = "Spawning vehicle."
}

config.lang = config.pt_BR






config.garageThread = function()
	Citizen.CreateThread(function()
		while true do
			local idle = 500
			if not nui and length(nearestGarages) > 0 then
				local playercoords = GetEntityCoords(PlayerPedId())
				for i in pairs(nearestGarages) do
					if nearestGarages[i] then
						idle = 5
						local coords = nearestGarages[i].coords
						local marker = nearestGarages[i].marker 
						config.drawMarker(coords,marker)
						local distance = #(playercoords - coords)
						if distance < 2 and IsControlJustPressed(0,38) then
							if nearestGarages[i].type == "home" then
								if func.hasHome(nearestGarages[i].home) then
									homeGarage = nearestGarages[i].home
									toggleNui(nearestGarages[i])
								end
							elseif func.hasPermission(nearestGarages[i].perm) then
								homeGarage = false
								toggleNui(nearestGarages[i], nearestGarages[i].type == "service")
							end
						end
					end
				end
			end
			Citizen.Wait(idle)
		end
	end)
end

config.nearestGaragesThread = function()
	Citizen.CreateThread(function()
		while true do
			if not nui then
				local playercoords = GetEntityCoords(PlayerPedId())
				for i in pairs(config.garages) do 
					local distance = #(playercoords - config.garages[i].coords)
					if distance < 10 then
						nearestGarages[i] = config.garages[i]
					elseif nearestGarages[i] then
						nearestGarages[i] = nil
					end
				end
				for i in pairs(config.homeGarages) do 
					local distance = #(playercoords - config.homeGarages[i].coords)
					if distance < 10 then
						nearestGarages["home-"..i] = config.homeGarages[i]
					elseif nearestGarages["home-"..i] then
						nearestGarages["home-"..i] = nil
					end
				end
			end
			Citizen.Wait(500)
		end
	end)
end


config.customState = function(user_id, vehicle)
	local res = { liberacao = "Em dia", status = "Liberado", classLiberacao = "", classStatus = "", popup = false }
	if vehicle.detido > 0 then
		if parseInt(vehicle.time) == 0 then
			local price = vRP.format( vehicle.price * (config.seguradora / 100) )
			res.liberacao = "$ "..price
			res.status = "Apreendido"
			res.classStatus = "seguradora"
			res.popup = "veículo apreendido, deseja liberar pagando <b>$ "..price.."</b> ?"
		else
			local price = vRP.format( vehicle.price * (config.detido / 100) )
			res.liberacao = "$ "..price
			res.status = "Detido"
			res.classStatus = "detido"
			res.popup = "veículo detido, deseja liberar pagando <b>$ "..price.."</b> ?"
		end
		res.classLiberacao = "detido"
	elseif parseInt(vehicle.ipva + 24 * 15 * 60 * 60) <= parseInt(os.time()) then
		local price = vRP.format( vehicle.price * (config.ipva / 100) )
		res.liberacao = "$ "..price
		res.status = "IPVA Atrasado"
		res.classStatus = "seguradora"
		res.classLiberacao = "detido"
		res.popup = "veículo com ipva atrasado, deseja liberar pagando <b>$ "..price.."</b> ?"
		--[[ if vehicle.expiretime and vehicle.expiretime > 0 then
			price = config.getVehiclePriceDimas(vehicle.vehicle)
			res.liberacao = price.." dimas"
			res.popup = "veículo com ipva atrasado, deseja liberar pagando <b> "..price.." dimas</b> ?"
		end ]]
	elseif vehicle.tax then
		local price = vRP.format(vehicle.tax)
		res.liberacao = "$ "..price
		res.classLiberacao = "seguradora"
		res.popup = "deseja retirar o veículo "..vehicle.name.." por <b>$ "..price.."</b> ?"
	end
	return res
end



--[[ config.customMYSQL = true
vRP._prepare("vRP/create_ipva", "ALTER TABLE vrp_vehicles ADD IF NOT EXISTS ipva varchar(255) DEFAULT '1630912803'")
vRP._prepare("vRP/getVehicles", "SELECT * FROM vrp_vehicles WHERE user_id = @user_id")
vRP._prepare("vRP/getVehicle", "SELECT * FROM vrp_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/setDetido", "UPDATE vrp_vehicles SET arrest = @detido, time = @time, ipva = @ipva WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/setIpva", "UPDATE vrp_vehicles SET ipva = @ipva WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("vRP/setVehicleData", "UPDATE vrp_vehicles SET engine = @engine, body = @body, fuel = @fuel, estado = @estado WHERE user_id = @user_id AND vehicle = @vehicle") ]]