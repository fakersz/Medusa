--[[ 
# Programação base by SummeRz
# Edição e correção by stopzera
# NUI/INTERFACE by stopzera
# Discord.gg/prp
--]]--

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vRPN = {}
Tunnel.bindInterface("vrp_inventory",vRPN)
Proxy.addInterface("vrp_inventory",vRPN)

local idgens = Tools.newIDGenerator()

vGARAGE = Tunnel.getInterface("vrp_garages")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookequipar = "url-aqui" 
local webhookenviaritem = "url-aqui"
local webhookdropar = "url-aqui"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local actived = {}
local bandagem = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOCHILA
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPN.Mochila()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local inventario = {}
		local inv = vRP.getInventory(user_id)
		for k,v in pairs(inv) do
			if vRP.itemBodyList(k) then

			table.insert(inventario,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, type = vRP.itemTypeList(k), peso = vRP.getItemWeight(k), desc = vRP.itemDescList(k) })

			end
		end
		return inventario,vRP.getInventoryWeight(user_id),vRP.getInventoryMaxWeight(user_id)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SENDITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPN.sendItem(itemName,amount)
	local source = source
	if itemName then
		local user_id = vRP.getUserId(source)
		local nplayer = vRPclient.getNearestPlayer(source,2)
		local nuser_id = vRP.getUserId(nplayer)
		local identity = vRP.getUserIdentity(user_id)
		local identitynu = vRP.getUserIdentity(nuser_id)
		if nuser_id and vRP.itemIndexList(itemName) and itemName ~= "identidade" then
			if parseInt(amount) > 0 then
				if vRP.getInventoryWeight(nuser_id) + vRP.getItemWeight(itemName) * amount <= vRP.getInventoryMaxWeight(nuser_id) then
					if vRP.tryGetInventoryItem(user_id,itemName,amount) then
						vRP.giveInventoryItem(nuser_id,itemName,amount)
						vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
						TriggerClientEvent("Notify",source,"sucesso","Enviou <b>"..vRP.format(amount).."x "..vRP.itemNameList(itemName).."</b>.",8000)
						PerformHttpRequest(webhookenviaritem, function(err, text, headers) end, 'POST', json.encode({
							embeds = {
								{ 
									title = "REGISTRO DE INVENTARIO",
									thumbnail = {
									url = "url-aqui"
									}, 
									fields = {
										{ 
											name = "**PARA QUEM ENVIOU:**", 
											value = "` "..identitynu.name.." "..identitynu.firstname.." ["..nuser_id.."] `"
										},
										{ 
											name = "**ENVIOU:**", 
											value = "` ["..vRP.format(amount).." "..vRP.itemNameList(itemName).."] `"
										},
										{ 
											name = "**QUEM ENVIOU:**", 
											value = "` "..identity.name.." "..identity.firstname.." ["..user_id.."] `"
										}
									}, 
									footer = { 
										text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
										icon_url = "url-aqui" 
									},
									color = 15914080 
								}
							}
						}), { ['Content-Type'] = 'application/json' })
						TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>"..vRP.format(amount).."x "..vRP.itemNameList(itemName).."</b>.",8000)
						vRPclient._playAnim(nplayer,true,{{"mp_common","givetake1_a"}},false)
						TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
						TriggerClientEvent('vrp_inventory:Update',nplayer,'updateMochila')
						return true
					end
				end
			else
				local inv = vRP.getInventory(user_id)
				for k,v in pairs(inv) do
					if itemName == k then
						if vRP.getInventoryWeight(nuser_id) + vRP.getItemWeight(itemName) * parseInt(v.amount) <= vRP.getInventoryMaxWeight(nuser_id) then
							if vRP.tryGetInventoryItem(user_id,itemName,parseInt(v.amount)) then
								vRP.giveInventoryItem(nuser_id,itemName,parseInt(v.amount))
								vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
								TriggerClientEvent("Notify",source,"sucesso","Enviou <b>"..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(itemName).."</b>.",8000)
								PerformHttpRequest(webhookenviaritem, function(err, text, headers) end, 'POST', json.encode({
									embeds = {
										{ 
											title = "REGISTRO DE INVENTARIO",
											thumbnail = {
											url = "url-aqui"
											}, 
											fields = {
												{ 
													name = "**PARA QUEM ENVIOU:**", 
													value = "` "..identitynu.name.." "..identitynu.firstname.." ["..nuser_id.."] `"
												},
												{ 
													name = "**ENVIOU:**", 
													value = "` ["..vRP.format(parseInt(v.amount)).." "..vRP.itemNameList(itemName).."] `"
												},
												{ 
													name = "**QUEM ENVIOU:**", 
													value = "` "..identity.name.." "..identity.firstname.." ["..user_id.."] `"
												}
											}, 
											footer = { 
												text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
												icon_url = "url-aqui" 
											},
											color = 15914080 
										}
									}
								}), { ['Content-Type'] = 'application/json' })
								TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>"..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(itemName).."</b>.",8000)
								vRPclient._playAnim(nplayer,true,{{"mp_common","givetake1_a"}},false)
								TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
								TriggerClientEvent('vrp_inventory:Update',nplayer,'updateMochila')
								return true
							end
						end
					end
				end
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DROPITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPN.dropItem(itemName,amount)
	local source = source
	if itemName then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local x,y,z = vRPclient.getPosition(source)
		if parseInt(amount) > 0 and vRP.tryGetInventoryItem(user_id,itemName,amount) then
			TriggerEvent("DropSystem:create",itemName,amount,x,y,z,3600)
			vRPclient._playAnim(source,true,{{"pickup_object","pickup_low"}},false)
			PerformHttpRequest(webhookdropar, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE INVENTARIO",
						thumbnail = {
						url = "url-aqui"
						}, 
						fields = {
							{ 
								name = "**DROPOU:**", 
								value = "` ["..vRP.itemNameList(itemName).."] `"
							},
							{ 
								name = "**QUANTIDADE:**", 
								value = "` ["..vRP.format(parseInt(amount)).."] `"
							},
							{ 
								name = "**QUEM DROPOU:**", 
								value = "` "..identity.name.." "..identity.firstname.." ["..user_id.."] `"
							}
						}, 
						footer = { 
							text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
							icon_url = "url-aqui" 
						},
						color = 15914080 
					}
				}
			}), { ['Content-Type'] = 'application/json' })
			TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
			return true
		else
			local data = vRP.getUserDataTable(user_id)
			for k,v in pairs(data.inventory) do
				if itemName == k then
					if vRP.tryGetInventoryItem(user_id,itemName,parseInt(v.amount)) then
						TriggerEvent("DropSystem:create",itemName,parseInt(v.amount),x,y,z,3600)
						vRPclient._playAnim(source,true,{{"pickup_object","pickup_low"}},false)
						PerformHttpRequest(webhookdropar, function(err, text, headers) end, 'POST', json.encode({
							embeds = {
								{ 
									title = "REGISTRO DE INVENTARIO",
									thumbnail = {
									url = "url-aqui"
									}, 
									fields = {
										{ 
											name = "**DROPOU:**", 
											value = "` ["..vRP.itemNameList(itemName).."] `"
										},
										{ 
											name = "**QUANTIDADE:**", 
											value = "` ["..vRP.format(parseInt(v.amount)).."] `"
										},
										{ 
											name = "**QUEM DROPOU:**", 
											value = "` "..identity.name.." "..identity.firstname.." ["..user_id.."] `"
										}
									}, 
									footer = { 
										text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
										icon_url = "url-aqui" 
									},
									color = 15914080 
								}
							}
						}), { ['Content-Type'] = 'application/json' })
						TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
						return true
					end
				end
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANDAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		for k,v in pairs(bandagem) do
			if v > 0 then
				bandagem[k] = v - 5
				if v == 0 then
					bandagem[k] = nil
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- USEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
local pick = {}
local blips = {}
function vRPN.useItem(itemName,type,ramount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id and ramount ~= nil and parseInt(ramount) >= 0 and not actived[user_id] and actived[user_id] == nil then
		if type == "usar" then
			if itemName == "bandagem" then
				vida = vRPclient.getHealth(source)
				if vida > 101 and vida < 400 then
					if bandagem[user_id] == 0 or not bandagem[user_id] then
						if vRP.tryGetInventoryItem(user_id,"bandagem",1) then
							actived[user_id] = true
							vRPclient._CarregarObjeto(source,"amb@world_human_clipboard@male@idle_a","idle_c","v_ret_ta_firstaid",49,60309)
							TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
							TriggerClientEvent('cancelando',source,true)
							TriggerClientEvent("progress",source,60000,"bandagem")
							SetTimeout(60000,function()
								actived[user_id] = nil
								bandagem[user_id] = 60
								TriggerClientEvent('bandagem',source)
								TriggerClientEvent('cancelando',source,false)
								vRPclient._DeletarObjeto(source)
								TriggerClientEvent("Notify",source,"sucesso","Bandagem utilizada com sucesso.",8000)
							end)
						end
					else
						TriggerClientEvent("Notify",source,"importante","Você precisa aguardar <b>"..bandagem[user_id].." segundos</b> para utilizar outra Bandagem.",8000)
					end
				else
					TriggerClientEvent("Notify",source,"negado","Você não pode utilizar de vida cheia ou nocauteado.",8000)
				end
            elseif itemName == "xerelto" then
                if vRP.tryGetInventoryItem(user_id,"xerelto",1) then
                	vRPclient._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)
                	TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
                	TriggerClientEvent('cancelando',source,true)
                    TriggerClientEvent("progress",source,20500,"xerelto")
                    SetTimeout(20500,function()
                        TriggerClientEvent('cancelando',source,false)
                        TriggerClientEvent("resetBleeding",source)
                        vRPclient._DeletarObjeto(source)
                        TriggerClientEvent("Notify",source,"sucesso","Xerelto utilizado com sucesso.",8000)
                    end)
                end
            elseif itemName == "coumadin" then
                if vRP.tryGetInventoryItem(user_id,"coumadin",1) then
                	vRPclient._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)
                	TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')	
					TriggerClientEvent('cancelando',source,true)
                    TriggerClientEvent("progress",source,20500,"coumadin")
                    SetTimeout(20500,function()
                        TriggerClientEvent('cancelando',source,false)
                        TriggerClientEvent("resetBleeding",source)
                        vRPclient._DeletarObjeto(source)
                        TriggerClientEvent("Notify",source,"sucesso","Coumadin utilizado com sucesso.",8000)
                    end)
                end
			elseif itemName == "dorflex" or itemName == "cicatricure" or itemName == "dipiroca" or itemName == "nocucedin" or itemName == "paracetanal" or itemName == "decupramim" or itemName == "buscopau" or itemName == "navagina" or itemName == "analdor" or itemName == "sefodex" or itemName == "nokusin" or itemName == "glicoanal" then
				if (vRP.tryGetInventoryItem(user_id,"dorflex",1) or vRP.tryGetInventoryItem(user_id,"cicatricure",1) or vRP.tryGetInventoryItem(user_id,"dipiroca",1) or vRP.tryGetInventoryItem(user_id,"nocucedin",1) or vRP.tryGetInventoryItem(user_id,"paracetanal",1) or vRP.tryGetInventoryItem(user_id,"decupramim",1) or vRP.tryGetInventoryItem(user_id,"buscopau",1) or vRP.tryGetInventoryItem(user_id,"navagina",1) or vRP.tryGetInventoryItem(user_id,"analdor",1) or vRP.tryGetInventoryItem(user_id,"sefodex",1) or vRP.tryGetInventoryItem(user_id,"nokusin",1) or vRP.tryGetInventoryItem(user_id,"glicoanal",1)) then
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					vRPclient._playAnim(source,true,{{"mp_player_intdrink","loop_bottle"}},true)	
					TriggerClientEvent('cancelando',source,true)
					TriggerClientEvent("progress",source,5000,"remedio")
					SetTimeout(5000,function()
						vRPclient._stopAnim(source,false)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent("Notify",source,"sucesso","Remédio utilizado com sucesso.",8000)
					end)
				end	
			elseif itemName == "mochila" then
				if vRP.tryGetInventoryItem(user_id,"mochila",1) then
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					vRP.varyExp(user_id,"physical","strength",650)
					TriggerClientEvent("Notify",source,"sucesso","Mochila utilizada com sucesso.",8000)
				end
			elseif itemName == "cerveja" then
				if vRP.tryGetInventoryItem(user_id,"cerveja",1) then
					actived[user_id] = true
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					TriggerClientEvent('cancelando',source,true)
					vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
					TriggerClientEvent("progress",source,30000,"bebendo")
					SetTimeout(30000,function()
						actived[user_id] = nil
						vRPclient.playScreenEffect(source,"RaceTurbo",180)
						vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
						TriggerClientEvent('cancelando',source,false)
						vRPclient._DeletarObjeto(source)
						TriggerClientEvent("Notify",source,"sucesso","Cerveja utilizada com sucesso.",8000)
					end)
				end
			elseif itemName == "tequila" then
				if vRP.tryGetInventoryItem(user_id,"tequila",1) then
					actived[user_id] = true
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					TriggerClientEvent('cancelando',source,true)
					vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
					TriggerClientEvent("progress",source,30000,"bebendo")
					SetTimeout(30000,function()
						actived[user_id] = nil
						vRPclient.playScreenEffect(source,"RaceTurbo",180)
						vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
						TriggerClientEvent('cancelando',source,false)
						vRPclient._DeletarObjeto(source)
						TriggerClientEvent("Notify",source,"sucesso","Tequila utilizada com sucesso.",8000)
					end)
				end
			elseif itemName == "vodka" then
				if vRP.tryGetInventoryItem(user_id,"vodka",1) then
					actived[user_id] = true
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					TriggerClientEvent('cancelando',source,true)
					vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
					TriggerClientEvent("progress",source,30000,"bebendo")
					SetTimeout(30000,function()
						actived[user_id] = nil
						vRPclient.playScreenEffect(source,"RaceTurbo",180)
						vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
						TriggerClientEvent('cancelando',source,false)
						vRPclient._DeletarObjeto(source)
						TriggerClientEvent("Notify",source,"sucesso","Vodka utilizada com sucesso.",8000)
					end)
				end
			elseif itemName == "whisky" then
				if vRP.tryGetInventoryItem(user_id,"whisky",1) then
					actived[user_id] = true
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					TriggerClientEvent('cancelando',source,true)
					vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422)
					TriggerClientEvent("progress",source,30000,"bebendo")
					SetTimeout(30000,function()
						actived[user_id] = nil
						vRPclient.playScreenEffect(source,"RaceTurbo",180)
						vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
						TriggerClientEvent('cancelando',source,false)
						vRPclient._DeletarObjeto(source)
						TriggerClientEvent("Notify",source,"sucesso","Whisky utilizado com sucesso.",8000)
					end)
				end
			elseif itemName == "conhaque" then
				if vRP.tryGetInventoryItem(user_id,"conhaque",1) then
					actived[user_id] = true
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					TriggerClientEvent('cancelando',source,true)
					vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
					TriggerClientEvent("progress",source,30000,"bebendo")
					SetTimeout(30000,function()
						actived[user_id] = nil
						vRPclient.playScreenEffect(source,"RaceTurbo",180)
						vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
						TriggerClientEvent('cancelando',source,false)
						vRPclient._DeletarObjeto(source)
						TriggerClientEvent("Notify",source,"sucesso","Conhaque utilizado com sucesso.",8000)
					end)
				end
			elseif itemName == "absinto" then
				if vRP.tryGetInventoryItem(user_id,"absinto",1) then
					actived[user_id] = true
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					TriggerClientEvent('cancelando',source,true)
					vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
					TriggerClientEvent("progress",source,30000,"bebendo")
					SetTimeout(30000,function()
						actived[user_id] = nil
						vRPclient.playScreenEffect(source,"RaceTurbo",180)
						vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
						TriggerClientEvent('cancelando',source,false)
						vRPclient._DeletarObjeto(source)
						TriggerClientEvent("Notify",source,"sucesso","Absinto utilizado com sucesso.",8000)
					end)
				end
			elseif itemName == "identidade" then
				local nplayer = vRPclient.getNearestPlayer(source,2)
				if nplayer then
					local identity = vRP.getUserIdentity(user_id)
					if identity then
						TriggerClientEvent("Identity2",nplayer,identity.name,identity.firstname,identity.user_id,identity.registration)
					end
				end
			elseif itemName == "maconha" then
				if vRP.tryGetInventoryItem(user_id,"maconha",1) then
					actived[user_id] = true
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
					TriggerClientEvent("progress",source,10000,"fumando")
					SetTimeout(10000,function()
						actived[user_id] = nil
						vRPclient._stopAnim(source,false)
						vRPclient.playScreenEffect(source,"RaceTurbo",180)
						vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
						TriggerClientEvent("Notify",source,"sucesso","Maconha utilizada com sucesso.",8000)
						TriggerClientEvent("vrp_sound:source",source,'love',0.5)
					end)
				end
			elseif itemName == "cocaina" then
				if vRP.tryGetInventoryItem(user_id,"cocaina",1) then
					actived[user_id] = true
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
					TriggerClientEvent('cancelando',source,true)
					TriggerClientEvent("progress",source,10000,"cheirando")
					SetTimeout(10000,function()
						actived[user_id] = nil
						vRPclient._stopAnim(source,false)
						--TriggerClientEvent('energeticos',source,true)
						TriggerClientEvent('cancelando',source,false)
						vRPclient.playScreenEffect(source,"RaceTurbo",120)
						vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",120)
						TriggerClientEvent("Notify",source,"sucesso","Cocaína utilizada com sucesso.",8000)
					end)
					--[[SetTimeout(120000,function()
						TriggerClientEvent('energeticos',source,false)
						TriggerClientEvent("Notify",source,"aviso","O efeito da cocaína passou e o coração voltou a bater normalmente.",8000)
					end)]]
				end
			elseif itemName == "metanfetamina" then
				if vRP.tryGetInventoryItem(user_id,"metanfetamina",1) then
					actived[user_id] = true
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
					TriggerClientEvent("progress",source,10000,"fumando")
					SetTimeout(10000,function()
						actived[user_id] = nil
						vRPclient._stopAnim(source,false)
						vRPclient.playScreenEffect(source,"RaceTurbo",180)
						vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
						TriggerClientEvent("Notify",source,"sucesso","Metanfetamina utilizada com sucesso.",8000)
					end)
				end	
			elseif itemName == "lsd" then
				if vRP.tryGetInventoryItem(user_id,"lsd",1) then
					actived[user_id] = true
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
					TriggerClientEvent("progress",source,10000,"tomando")
					SetTimeout(10000,function()
						actived[user_id] = nil
						vRPclient._stopAnim(source,false)
						vRPclient.playScreenEffect(source,"RaceTurbo",180)
						vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
						TriggerClientEvent("Notify",source,"sucesso","LSD utilizado com sucesso.",8000)
					end)
				end		
			elseif itemName == "rebite" then
				if vRP.tryGetInventoryItem(user_id,"rebite",1) then
					actived[user_id] = true
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					TriggerClientEvent('cancelando',source,true)
					vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
					TriggerClientEvent("progress",source,10000,"bebendo")
					SetTimeout(10000,function()
						actived[user_id] = nil
						vRPclient.playScreenEffect(source,"RaceTurbo",90)
						vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",90)
						TriggerClientEvent('energeticos',source,true)
						TriggerClientEvent('cancelando',source,false)
						vRPclient._DeletarObjeto(source)
						TriggerClientEvent("Notify",source,"sucesso","Rebite utilizado com sucesso.",8000)
					end)
					SetTimeout(90000,function()
						TriggerClientEvent('energeticos',source,false)
						TriggerClientEvent("Notify",source,"importante","O efeito do rebite passou e o coração voltou a bater normalmente.",8000)
					end)
				end
			elseif itemName == "capuz" then
				if vRP.getInventoryItemAmount(user_id,"capuz") >= 1 then
					local nplayer = vRPclient.getNearestPlayer(source,2)
					if nplayer then
						vRPclient.setCapuz(nplayer)
						vRP.closeMenu(nplayer)
						TriggerClientEvent("Notify",source,"sucesso","Capuz utilizado com sucesso.",8000)
					end
				end
			elseif itemName == "energetico" then
				if vRP.tryGetInventoryItem(user_id,"energetico",1) then
					actived[user_id] = true
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					TriggerClientEvent('cancelando',source,true)
					vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
					TriggerClientEvent("progress",source,20000,"bebendo")
					SetTimeout(20000,function()
						actived[user_id] = nil
						TriggerClientEvent('energeticos',source,true)
						TriggerClientEvent('cancelando',source,false)
						vRPclient._DeletarObjeto(source)
						TriggerClientEvent("Notify",source,"sucesso","Energético utilizado com sucesso.",8000)
					end)
					SetTimeout(60000,function()
						TriggerClientEvent('energeticos',source,false)
						TriggerClientEvent("Notify",source,"importante","O efeito do energético passou e o coração voltou a bater normalmente.",8000)
					end)
				end
			elseif itemName == "lockpick" then
				local vehicle,vnetid,placa,vname,lock,banned,trunk,model,street = vRPclient.vehList(source,7)
				local policia = vRP.getUsersByPermission("policia.permissao")
				if #policia < 0 then
					TriggerClientEvent("Notify",source,"negado","Número insuficiente de policiais no momento para iniciar o roubo.")
					return true
				end
				if vRP.hasPermission(user_id,"policia.permissao") then
					TriggerEvent("setPlateEveryone",placa)
					vGARAGE.vehicleClientLock(-1,vnetid,lock)
					TriggerClientEvent("vrp_sound:source",source,'lock',0.5)
					return
				end
				if vRP.getInventoryItemAmount(user_id,"lockpick") >= 1 and vRP.tryGetInventoryItem(user_id,"lockpick",1) and vehicle then
					actived[user_id] = true
					if vRP.hasPermission(user_id,"polpar.permissao") then
						actived[user_id] = nil
						TriggerEvent("setPlateEveryone",placa)
						vGARAGE.vehicleClientLock(-1,vnetid,lock)
						return
					end

					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
					TriggerClientEvent("progress",source,30000,"roubando")
					SetTimeout(30000,function()
						actived[user_id] = nil
						TriggerClientEvent('cancelando',source,false)
						vRPclient._stopAnim(source,false)

						if math.random(100) >= 50 then
							TriggerEvent("setPlateEveryone",placa)
							vGARAGE.vehicleClientLock(-1,vnetid,lock)
							TriggerClientEvent("vrp_sound:source",source,'lock',0.5)
						else
							TriggerClientEvent("Notify",source,"negado","Roubo do veículo falhou e as autoridades foram acionadas.",8000)
							local policia = vRP.getUsersByPermission("policia.permissao")
							local x,y,z = vRPclient.getPosition(source)
							for k,v in pairs(policia) do
								local player = vRP.getUserSource(parseInt(v))
								if player then
									async(function()
										local id = idgens:gen()
										vRPclient._playSound(player,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
										TriggerClientEvent('chatMessage',player,"911 - ",{64,64,255},"Roubo na ^1"..street.."^0 do veículo ^1"..model.."^0 de placa ^1"..placa.."^0 verifique o ocorrido.")
										pick[id] = vRPclient.addBlip(player,x,y,z,10,5,"Ocorrência",0.5,false)
										SetTimeout(20000,function() vRPclient.removeBlip(player,pick[id]) idgens:free(id) end)
									end)
								end
							end
						end
					end)
				end
			elseif itemName == "masterpick" then
				local vehicle,vnetid,placa,vname,lock,banned,trunk,model,street = vRPclient.vehList(source,7)
				local policia = vRP.getUsersByPermission("policia.permissao")
				if #policia < 5 then
					TriggerClientEvent("Notify",source,"negado","Número insuficiente de policiais no momento para iniciar o roubo.")
					return true
				end
				if vRP.hasPermission(user_id,"policia.permissao") then
					TriggerEvent("setPlateEveryone",placa)
					vGARAGE.vehicleClientLock(-1,vnetid,lock)
					TriggerClientEvent("vrp_sound:source",source,'lock',0.5)
					return
				end
				if vRP.getInventoryItemAmount(user_id,"masterpick") >= 1 and vRP.tryGetInventoryItem(user_id,"masterpick",1) and vehicle then
					actived[user_id] = true
					if vRP.hasPermission(user_id,"polpar.permissao") then
						actived[user_id] = nil
						TriggerEvent("setPlateEveryone",placa)
						vGARAGE.vehicleClientLock(-1,vnetid,lock)
						return
					end

					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
					TriggerClientEvent("progress",source,60000,"roubando")
					SetTimeout(60000,function()
						actived[user_id] = nil
						TriggerClientEvent('cancelando',source,false)
						vRPclient._stopAnim(source,false)
						TriggerEvent("setPlateEveryone",placa)
						vGARAGE.vehicleClientLock(-1,vnetid,lock)
						TriggerClientEvent("vrp_sound:source",source,'lock',0.5)
						TriggerClientEvent("Notify",source,"importante","Roubo do veículo concluído e as autoridades foram acionadas.",8000)
						local policia = vRP.getUsersByPermission("policia.permissao")
						local x,y,z = vRPclient.getPosition(source)
						for k,v in pairs(policia) do
							local player = vRP.getUserSource(parseInt(v))
							if player then
								async(function()
									local id = idgens:gen()
									vRPclient._playSound(player,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
									TriggerClientEvent('chatMessage',player,"911 - ",{64,64,255},"Roubo na ^1"..street.."^0 do veículo ^1"..model.."^0 de placa ^1"..placa.."^0 verifique o ocorrido.")
									pick[id] = vRPclient.addBlip(player,x,y,z,10,5,"Ocorrência",0.5,false)
									SetTimeout(20000,function() vRPclient.removeBlip(player,pick[id]) idgens:free(id) end)
								end)
							end
						end
					end)
				end
			elseif itemName == "militec" then
				if not vRPclient.isInVehicle(source) then
					local vehicle = vRPclient.getNearestVehicle(source,3.5)
					if vehicle then
						if vRP.hasPermission(user_id,"mecanico.permissao") then
							actived[user_id] = true
							TriggerClientEvent('cancelando',source,true)
							vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
							TriggerClientEvent("progress",source,30000,"reparando motor")
							SetTimeout(30000,function()
								actived[user_id] = nil
								TriggerClientEvent('cancelando',source,false)
								TriggerClientEvent('repararmotor',source,vehicle)
								vRPclient._stopAnim(source,false)
							end)
						else
							if vRP.tryGetInventoryItem(user_id,"militec",1) then
								actived[user_id] = true
								TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
								TriggerClientEvent('cancelando',source,true)
								vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
								TriggerClientEvent("progress",source,30000,"reparando motor")
								SetTimeout(30000,function()
									actived[user_id] = nil
									TriggerClientEvent('cancelando',source,false)
									TriggerClientEvent('repararmotor',source,vehicle)
									vRPclient._stopAnim(source,false)
								end)
							end
						end
					end
				end	
			elseif itemName == "repairkit" then
				if not vRPclient.isInVehicle(source) then
					local vehicle = vRPclient.getNearestVehicle(source,3.5)
					if vehicle then
						if vRP.hasPermission(user_id,"mecanico.permissao") then
							actived[user_id] = true
							TriggerClientEvent('cancelando',source,true)
							vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
							TriggerClientEvent("progress",source,30000,"reparando veículo")
							SetTimeout(30000,function()
								actived[user_id] = nil
								TriggerClientEvent('cancelando',source,false)
								TriggerClientEvent('reparar',source)
								vRPclient._stopAnim(source,false)
							end)
						else
							if vRP.tryGetInventoryItem(user_id,"repairkit",1) then
								actived[user_id] = true
								TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
								TriggerClientEvent('cancelando',source,true)
								vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
								TriggerClientEvent("progress",source,30000,"reparando veículo")
								SetTimeout(30000,function()
									actived[user_id] = nil
									TriggerClientEvent('cancelando',source,false)
									TriggerClientEvent('reparar',source)
									vRPclient._stopAnim(source,false)
								end)
							end
						end
					end
				end	
			elseif itemName == "pneus" then
				if not vRPclient.isInVehicle(source) then
					local vehicle = vRPclient.getNearestVehicle(source,3)
					if vehicle then
						if vRP.hasPermission(user_id,"mecanico.permissao") then
							actived[user_id] = true
							TriggerClientEvent('cancelando',source,true)
							vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
							TriggerClientEvent("progress",source,30000,"reparando pneus")
							SetTimeout(30000,function()
								actived[user_id] = nil
								TriggerClientEvent('cancelando',source,false)
								TriggerClientEvent('repararpneus',source,vehicle)
								vRPclient._stopAnim(source,false)
							end)
						else
							if vRP.tryGetInventoryItem(user_id,"pneus",1) then
								actived[user_id] = true
								TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
								TriggerClientEvent('cancelando',source,true)
								vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
								TriggerClientEvent("progress",source,30000,"reparando pneus")
								SetTimeout(30000,function()
									actived[user_id] = nil
									TriggerClientEvent('cancelando',source,false)
									TriggerClientEvent('repararpneus',source,vehicle)
									vRPclient._stopAnim(source,false)
								end)
							end
						end
					end
				end	
			elseif itemName == "notebook" then
				if vRPclient.isInVehicle(source) then
					local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
					if vehicle and placa then
						actived[user_id] = true
						vGARAGE.freezeVehicleNotebook(source,vehicle)
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent("progress",source,59500,"removendo rastreador")
						SetTimeout(60000,function()
							actived[user_id] = nil
							TriggerClientEvent('cancelando',source,false)
							local placa_user_id = vRP.getUserByRegistration(placa)
							if placa_user_id then
								local player = vRP.getUserSource(placa_user_id)
								if player then
									vGARAGE.removeGpsVehicle(player,vname)
								end
							end
						end)
					end
				end
			elseif itemName == "placa" then
				if vRPclient.isInVehicle(source) then
					if vRP.tryGetInventoryItem(user_id,"placa",1) then
						TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent("progress",source,60000,"clonando")
						SetTimeout(60000,function()
							TriggerClientEvent('cancelando',source,false)
							TriggerClientEvent("cloneplates",source)
							TriggerClientEvent("Notify",source,"sucesso","Placa clonada com sucesso.",8000)
						end)
					end
				end
			elseif itemName == "colete" then
				if vRP.tryGetInventoryItem(user_id,"colete",1) then
					vRPclient.setArmour(source,200)
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
					RegisterNetEvent('setcolete')
					TriggerClientEvent("Notify",source,"sucesso","<b>Colete</b> usado com sucesso.",8000)
		        end
			elseif itemName == "morfina" then
				local paramedico = vRP.getUsersByPermission("polpar.permissao")
				if parseInt(#paramedico) < 1 then
					local nplayer = vRPclient.getNearestPlayer(source,2)
					if nplayer then
						if vRPclient.isComa(nplayer) then
							if vRP.tryGetInventoryItem(user_id,"morfina",1) then
								TriggerClientEvent('cancelando',source,true)
								vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
								TriggerClientEvent("progress",source,30000,"reanimando")
								SetTimeout(30000,function()
									vRPclient.networkRessurection(nplayer)
									vRPclient._stopAnim(source,false)
									TriggerClientEvent('cancelando',source,false)
								end)
							end
						else
							TriggerClientEvent("Notify",source,"importante","A pessoa precisa estar em coma para prosseguir.",8000)
						end
					end
				end
			end
		elseif type == "equipar" then
			if vRP.tryGetInventoryItem(user_id,itemName,1) then
				local weapons = {}
				local identity = vRP.getUserIdentity(user_id)
				weapons[string.gsub(itemName,"wbody|","")] = { ammo = 0 }
				vRPclient._giveWeapons(source,weapons)
				PerformHttpRequest(webhookequipar, function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 
							title = "REGISTRO DE INVENTARIO",
							thumbnail = {
							url = "url-aqui"
							}, 
							fields = {
								{ 
									name = "**EQUIPOU:**", 
									value = "` ["..vRP.itemNameList(itemName).."] `"
								},
								{ 
									name = "**QUEM EQUIPOU:**", 
									value = "` "..identity.name.." "..identity.firstname.." ["..user_id.."] `"
								}
							}, 
							footer = { 
								text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
								icon_url = "url-aqui" 
							},
							color = 15914080 
						}
					}
				}), { ['Content-Type'] = 'application/json' })
				TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
			end
		elseif type == "recarregar" then
			local uweapons = vRPclient.getWeapons(source)
			local weaponuse = string.gsub(itemName,"wammo|","")
			local identity = vRP.getUserIdentity(user_id)
			if uweapons[weaponuse] then				
				if vRP.tryGetInventoryItem(user_id,"wammo|"..weaponuse,parseInt(ramount)) then
					local weapons = {}
					weapons[weaponuse] = { ammo = parseInt(ramount) }
					vRPclient._giveWeapons(source,weapons,false)
					PerformHttpRequest(webhookequipar, function(err, text, headers) end, 'POST', json.encode({
						embeds = {
							{ 
								title = "REGISTRO DE INVENTARIO",
								thumbnail = {
								url = "url-aqui"
								}, 
								fields = {
									{ 
										name = "**RECARREGOU:**", 
										value = "` ["..vRP.itemNameList(itemName).."] `"
									},
									{ 
										name = "**MUNIÇÃO:**", 
										value = "` ["..parseInt(ramount).."] `"
									},
									{ 
										name = "**QUEM RECARREGOU:**", 
										value = "` "..identity.name.." "..identity.firstname.." ["..user_id.."] `"
									}
								}, 
								footer = { 
									text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
									icon_url = "url-aqui" 
								},
								color = 15914080 
							}
						}
					}), { ['Content-Type'] = 'application/json' })
					TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
				end
			end
		end
	end
end
 
 
 
AddEventHandler("vRP:playerLeave",function(user_id,source)
	actived[parseInt(user_id)] = nil
end)