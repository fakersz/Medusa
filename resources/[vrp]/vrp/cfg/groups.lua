local cfg = {}

cfg.groups = {
	["Dono"] = {
		"dono.permissao",
		"admin.permissao",
		"manager.permissao",
		"mod.permissao",
		"suporte.permissao",
		"wl.permissao",
		"polpar.permissao",
		"ticket.permissao",
		"wall.permissao",
		"prop.permissao",
		"imune.permissao",
		"salario1.servico"	
    },
	["Admin"] = {
		"admin.permissao",
		"mod.permissao",
		"suporte.permissao",
		"wl.permissao",
		"polpar.permissao",
		"wall.permissao",
		"prop.permissao",
		"imune.permissao",
		"ticket.permissao",
		"salario1.servico"
	},
	["Mod"] = {
		"mod.permissao",
		"suporte.permissao",
		"wl.permissao",
		"polpar.permissao",
		"wall.permissao",
		"ticket.permissao",
		"imune.permissao",
		"salario2.servico"
	},
	["Suporte"] = {
		"suporte.permissao",
		"wl.permissao",
		"ticket.permissao",
		"imune.permissao",
		"salario3.servico"
	},
	["Whitelist"] = {
		"wl.permissao"
	},
	-----------------------------------------------------
	["Juiza"] = {
		_config = {
			title = "Juiza",
			gtype = "alt"
		},
		"juiza.permissao",
		"portadp.permissao",
		"sem.permissao"
	},
	["News"] = {
		_config = {
			title = "News",
			gtype = "job"
		},
		"news.permissao",
		"sem.permissao"	
	},
	["Vendedor"] = {
		_config = {
			title = "Vendedor",
			gtype = "altl"
		},
		"vendedor.permissao",
		"sem.permissao"	
	},
	["Advogado"] = {
		_config = {
			title = "Advogado",
			gtype = "alt"
		},
		"advogado.permissao",
		"sem.permissao"
	},
	-----------------------------------------------------
	-- Recruta
	["Recruta"] = {
		_config = {
			title = "Recruta PM",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"recruta.servico",
		"recruta.arsenal",
		"sem.permissao"
	},
	["PaisanaRecruta"] = {
		_config = {
			title = "Recruta Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"recruta.folga",
		"sem.permissao"
	},
	-- Soldado
	["Soldado"] = {
		_config = {
			title = "Soldado PM",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"soldesarg.arsenal",
		"portadp.permissao",
		"soldado.servico",
		"sem.permissao"
	},
	["PaisanaSoldado"] = {
		_config = {
			title = "Soldado Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"soldado.folga",
		"sem.permissao"
	},
	-- Sargento
	["Sargento"] = {
		_config = {
			title = "Sargento PM",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"soldesarg.arsenal",
		"sargento.servico",
		"sem.permissao"
	},
	["PaisanaSargento"] = {
		_config = {
			title = "Sargento Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"sargento.folga",
		"sem.permissao"
	},
	-- Tenete
	["Tenente"] = {
		_config = {
			title = "Tenente PM",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"tenenteecoronel.arsenal",
		"tenente.servico",
		"sem.permissao"
	},
	["PaisanaTenente"] = {
		_config = {
			title = "Tenente Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"tenente.folga",
		"sem.permissao"
	},
	-- Capitão
	["Capitão"] = {
		_config = {
			title = "Capitão PM",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"capitaoecoronel.arsenal",
		"capitao.servico",
		"sem.permissao"
	},
	["PaisanaCapitão"] = {
		_config = {
			title = "Capitão Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"capitao.folga",
		"sem.permissao"
	},
	-- Ten. Coronel
	["TenCoronel"] = {
		_config = {
			title = "Ten. Coronel PM",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"tencoronelecoronel.arsenal",
		"tencoronel.servico",
		"sem.permissao"
	},
	["PaisanaTenCoronel"] = {
		_config = {
			title = "T. Cel. Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"tencoronel.folga",
		"sem.permissao"
	},
	-- Coronel
	["Coronel"] = {
		_config = {
			title = "Coronel PM",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"pmerj.permissao",
		"portadp.permissao",
		"tenenteecoronel.arsenal",
		"coronel.servico",
		"sem.permissao"
	},
	["PaisanaCoronel"] = {
		_config = {
			title = "Coronel Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"coronel.folga",
		"sem.permissao"

	}, 
	["PaisanaBombeiro"] = {
		_config = {
			title = "Bombeiro Folga",
			gtype = "job"
		},
		"paisanabombeiro.permissao",
		"bombeiro.folga",
		"sem.permissao"
	},
	-----------------------------------------------------
	-- Enfermeiro ---------------------------------------
	-----------------------------------------------------
	["Enfermeiro"] = {
		_config = {
			title = "Enfermeiro",
			gtype = "job"
		},
		"paramedico.permissao",
		"enfermeiro.servico",
		"painel.permissao",
		"polpar.permissao",
		"sem.permissao"
	}, 
	["PaisanaEnfermeiro"] = {
		_config = {
			title = "Enfermeiro Folga",
			gtype = "job"
		},
		"paisanaenfermeiro.permissao",
		"enfermeiro.folga",
		"sem.permissao"
	},
	-- Paramédico
	["Paramedico"] = {
		_config = {
			title = "Paramédico",
			gtype = "job"
		},
		"paramedico.permissao",
		"paramedico.servico",
		"polpar.permissao",
		"sem.permissao"
	}, 
	["PaisanaParamedico"] = {
		_config = {
			title = "Paramédico Folga",
			gtype = "job"
		},
		"paisanaparamedico.permissao",
		"paramedico.folga",
		"sem.permissao"
	},
	-- Médico
	["Medico"] = {
		_config = {
			title = "Médico",
			gtype = "job"
		},
		"paramedico.permissao",
		"medico.servico",
		"polpar.permissao",
		"sem.permissao"
	}, 
	["PaisanaMedico"] = {
		_config = {
			title = "Médico Folga",
			gtype = "job"
		},
		"paisanamedico.permissao",
		"medico.folga",
		"sem.permissao"
	},
	-- Diretor
	["Diretor"] = {
		_config = {
			title = "Diretor",
			gtype = "job"
		},
		"paramedico.permissao",
		"diretor.servico",
		"polpar.permissao",
		"hp.permissao",
		"sem.permissao"
	}, 
	["PaisanaDiretor"] = {
		_config = {
			title = "Diretor Folga",
			gtype = "job"
		},
		"diretor.folga",
		"sem.permissao"
	},
	-----------------------------------------------------
	["Mecanico"] = {
		_config = {
			title = "Mecanico",
			gtype = "job"
		},
		"mecanico.permissao",
		"reparo.permissao",
		"painel.permissao",
		"desmanche.permissao",
		"callmec.permissao",
		"sem.permissao"
	},
	["PaisanaMecanico"] = {
		_config = {
			title = "Mecanico Folga",
			gtype = "job"
		},
		"paisanamecanico.permissao"
	},
	----------------------------------------------
	["Furious"] = {
		_config = {
			title = "Furious",
			gtype = "job"
		},
		"reparo.permissao",
		"desmanche.permissao",
		"sem.permissao",
		"nomade.permissao"
	},
	["Bronze"] = {
		_config = {
			title = "Bronze",
			gtype = "vip"
		},
		"Bronze.permissao",
		"vip.permissao"
	},
	["Prata"] = {
		_config = {
			title = "Prata",
			gtype = "vip"
		},
		"prata.permissao",
		"vip.permissao"
	},
	["Ouro"] = {
		_config = {
			title = "Ouro",
			gtype = "vip"
		},
		"ouro.permissao",
		"barcos.permissao",
		"mochila.permissao",
		"vip.permissao"
	},
	["Platina"] = {
		_config = {
			title = "Platina",
			gtype = "vip"
		},
		"barcos.permissao",
		"heli.permissao",
		"platina.permissao",
		"mochila.permissao",
		"vip.permissao"
	},
	["Diamante"] = {
		_config = {
			title = "Diamante",
			gtype = "vip"
		},
		"black.permissao",
		"mochila.permissao",
		"barcos.permissao",
		"heli.permissao",
		"vip.permissao"
	},
	["RUBY"] = {
		_config = {
			title = "RUBY",
			gtype = "vip"
		},
		"girafalis.permissao",
		"mochila.permissao",
		"barcos.permissao",
		"heli.permissao",
		"vip.permissao"
	},
	["SAPPHIRE"] = {
		_config = {
			title = "SAPPHIRE",
			gtype = "vip"
		},
		"chaves.permissao",
		"mochila.permissao",
		"barcos.permissao",
		"heli.permissao",
		"vip.permissao"	
---------------Favelas--------------		
	},
	["laranjas"] = {
		_config = {
			title = "Laranjas",
			gtype = "job"
		},
		"laranjas.permissao",
		"ilegal.permissao"
	},
	["roxos"] = { 
		_config = {
			title = "Roxos",
			gtype = "job"
		},
		"roxos.permissao",
		"ilegal.permissao"
		
	},
	["vermelho"] = { 
		_config = {
			title = "Vermelhos",
			gtype = "job"
		},
		"vermelho.permissao",
		"ilegal.permissao"
	},
	["rosas"] = { 
		_config = {
			title = "Rosas",
			gtype = "job"
		},
		"rosas.permissao",
		"ilegal.permissao"
	},
	["verdes"] = { 
		_config = {
			title = "Verdes",
			gtype = "job"
		},
		"verdes.permissao",
		"ilegal.permissao"
	},
	["brancos"] = { 
		_config = {
			title = "Brancos",
			gtype = "job"
		},
		"brancos.permissao",
		"ilegal.permissao"
	},
	------------Organizações---------------
	["vanilla"] = { -- LAVAGEM
		_config = {
			title = "Vanilla",
			gtype = "job"
		},
		"vanilla.permissao",
		"lavagem.permissao",
		"ilegal.permissao"
	},
	["vahamas"] = { -- LAVAGEM
		_config = {
			title = "Bahamas",
			gtype = "job"
		},
		"bahamas.permissao",
		"lavagem.permissao",
		"ilegal.permissao"
	},	
	["motoclub"] = { 
		_config = {
			title = "Motoclub",
			gtype = "job"
		},
		"motoclub.permissao",
		"municao.permissao",
		"desmanche.permissao",
		"cole.permissao",
		"ilegal.permissao"
	},
	["yellowjack"] = { 
	_config = {
		title = "Yellow Jack",
		gtype = "job"
	},
	"yellow.permissao",
	"municao.permissao",
	"desmanche.permissao",
	"cole.permissao",
	"ilegal.permissao"
},
	["yakuza"] = { -- ARMAS
		_config = {
			title = "yakuza",
			gtype = "job"
		},
		"cali.permissao",
		"municao.permissao",
		"ilegal.permissao",
		"yakuza.permissao"
	},
	["Taxista"] = {
		_config = {
			title = "Taxista",
			gtype = "Taxista"
			},
		"taxista.permissao"
	},
------------------------------------------------------
------------------ FACÇÕES VIPS ----------------------
------------------------------------------------------
	["Cassino"] = { -- ARMAS
		_config = {
			title = "Cassino",
			gtype = "job"
			},
		"cassino.permissao",
		"ilegal.permissao"
	},
	["mafia"] = { -- ARMAS
		_config = {
			title = "Mafia",
			gtype = "job"
			},
		"carteldemedelin.permissao",
		"ilegal.permissao",
		"mafia.permissao",
		"armavender.permissao"
	},	
	["milicia"] = { -- ARMAS
		_config = {
			title = "Milicia",
			gtype = "job"
			},
		"milicia.permissao",
		"ilegal.permissao"
	
	},
}

cfg.users = {
	[1] = { "Dono" }
	
}

cfg.selectors = {

}

return cfg