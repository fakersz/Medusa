local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vRPN = {}
Tunnel.bindInterface("dm_trunkchest",vRPN)
Proxy.addInterface("dm_trunkchest",vRPN)

vCLIENT = Tunnel.getInterface("nation_garages")

local inventory = module("vrp","cfg/inventory")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookbaucarro = "https://discord.com/api/webhooks/973797879326052402/mVKXSkW3NpuXHwIsFJm3Ulstu_ihg3sR0SqI-mWAk6wGH_GsEdb39hvB-B592gJFIPKs"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "baucarro" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local uchests = {}
local vchests = {}
local actived = {}
local actived2 = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANDAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		for k,v in pairs(actived2) do
			if v > 0 then
				actived2[k] = v - 2
				if v == 0 then
					actived2[k] = nil
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(actived) do
			if v > 0 then
				actived[k] = v - 1
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOCHILA
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPN.Mochila()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,vnetid,placa,vname,lock,banned,trunk = vRPclient.vehList(source,7)
		if vehicle then
			local placa_user_id = vRP.getUserByRegistration(placa)
			if placa_user_id then
				local myinventory = {}
				local myvehicle = {}
				local mala = "chest:u"..parseInt(placa_user_id).."veh_"..vname
				local data = vRP.getSData(mala)
				local sdata = json.decode(data) or {}
				local max_veh = inventory.chestweight[vname] or 50
				if sdata then
					for k,v in pairs(sdata) do
						table.insert(myinventory,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.getItemWeight(k) })
					end

					local data2 = vRP.getUserDataTable(user_id)
					if data2 and data2.inventory then
						for k,v in pairs(data2.inventory) do
							table.insert(myvehicle,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.getItemWeight(k) })
						end
					end

					uchests[parseInt(user_id)] = mala
					vchests[parseInt(user_id)] = vname
				end
				return myinventory,myvehicle,vRP.getInventoryWeight(user_id),vRP.getInventoryMaxWeight(user_id),vRP.computeItemsWeight(sdata),parseInt(max_veh)
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPN.storeItem(itemName,amount)
	
	local source = source
	if itemName then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		--if user_id and actived[user_id] == 0 or not actived[user_id] then
		if user_id and actived2[user_id] == 0 or not actived2[user_id] then
			if string.match(itemName,"dinheirosujo") or string.match(itemName,"identidade") then
				TriggerClientEvent("Notify",source,"importante","","Não pode guardar este item em veículos.")
				return
			end

			local data = vRP.getSData(uchests[user_id])
			local items = json.decode(data) or {}
			if items then
				local max_veh = inventory.chestweight[vchests[user_id]] or 50
				if parseInt(amount) > 0 then
					local new_weight = vRP.computeItemsWeight(items)+vRP.getItemWeight(itemName)*parseInt(amount)
					if new_weight <= parseInt(max_veh) then
						if vRP.tryGetInventoryItem(user_id,itemName,parseInt(amount)) then
							if items[itemName] ~= nil then
								items[itemName].amount = items[itemName].amount + parseInt(amount)
							else
								items[itemName] = { amount = parseInt(amount) }
							end
							SendWebhookMessage(webhookbaucarro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(items[itemName].amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..uchests[user_id].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							--actived[parseInt(user_id)] = 2
							actived2[parseInt(user_id)] = 2	
						end
					else
						TriggerClientEvent("Notify",source,"negado","","<b>Porta-Malas</b> cheio.")
					end
				else
					local inv = vRP.getInventory(parseInt(user_id))
					for k,v in pairs(inv) do
						if itemName == k then
							local new_weight = vRP.computeItemsWeight(items)+vRP.getItemWeight(itemName)*parseInt(v.amount)
							if new_weight <= parseInt(max_veh) then
								if vRP.tryGetInventoryItem(user_id,itemName,parseInt(v.amount)) then
									if items[itemName] ~= nil then
										items[itemName].amount = items[itemName].amount + parseInt(v.amount)
									else
										items[itemName] = { amount = parseInt(v.amount) }
									end
									SendWebhookMessage(webhookbaucarro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(v.amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..uchests[user_id].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									--actived[parseInt(user_id)] = 2
									actived2[parseInt(user_id)] = 2
								end
							else
								TriggerClientEvent("Notify",source,"negado","","<b>Porta-Malas</b> cheio.")
							end
						end
					end
				end
				vRP.setSData(uchests[parseInt(user_id)],json.encode(items))
				TriggerClientEvent('Creative:UpdateTrunk',source,'updateMochila')
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPN.takeItem(itemName,amount)
	
	local source = source
	if itemName then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if user_id and actived[parseInt(user_id)] == 0 or not actived[parseInt(user_id)] then
			local data = vRP.getSData(uchests[parseInt(user_id)])
			local items = json.decode(data) or {}
			if items then
				if parseInt(amount) > 0 then
					if items[itemName] ~= nil and items[itemName].amount >= parseInt(amount) then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(itemName)*parseInt(amount) <= vRP.getInventoryMaxWeight(user_id) then
							SendWebhookMessage(webhookbaucarro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..uchests[user_id].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							vRP.giveInventoryItem(user_id,itemName,parseInt(amount))
							items[itemName].amount = items[itemName].amount - parseInt(amount)
							if items[itemName].amount <= 0 then
								items[itemName] = nil
							end
							--actived[parseInt(user_id)] = 2
							actived[parseInt(user_id)] = 4
						else
							TriggerClientEvent("Notify",source,"negado","","<b>Mochila</b> cheia.")
						end
					end
				else
					if items[itemName] ~= nil and items[itemName].amount >= parseInt(amount) then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(itemName)*parseInt(items[itemName].amount) <= vRP.getInventoryMaxWeight(user_id) then
							vRP.giveInventoryItem(user_id,itemName,parseInt(items[itemName].amount))
							SendWebhookMessage(webhookbaucarro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(items[itemName].amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..uchests[user_id].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							items[itemName] = nil
							--actived[parseInt(user_id)] = 2
							actived[parseInt(user_id)] = 4
						else
							TriggerClientEvent("Notify",source,"negado","","<b>Mochila</b> cheia.")
						end
					end
				end
				TriggerClientEvent('Creative:UpdateTrunk',source,'updateMochila')
				vRP.setSData(uchests[parseInt(user_id)],json.encode(items))
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPN.chestClose()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,vnetid = vRPclient.vehList(source,7)
		if vehicle then
			vCLIENT.vehicleClientTrunk(-1,vnetid,true)
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPN.chestOpen()
    local source = source
    local user_id = vRP.getUserId(source)
    local nplayer = vRPclient.getNearestPlayer(source,5)
	local nuser_id = vRP.getUserId(nplayer)
	if nuser_id then
        TriggerClientEvent("Notify",source,"negado","","Você não consegue abrir o bau do carro com pessoas perto.")
    else
		local vehicle,vnetid,placa,vname,lock,banned,trunk = vRPclient.vehList(source,7)
		if vehicle then
			if lock == 1 then
				if banned then
					return
				end
				local placa_user_id = vRP.getUserByRegistration(placa)
				if placa_user_id then
					vCLIENT.vehicleClientTrunk(-1,vnetid,false)
					TriggerClientEvent("trunkchest:Open",source)
				end
			end
		end
	end
	return false
end

RegisterServerEvent("travasmala")
AddEventHandler("travasmala",function()
	TriggerClientEvent("Notify",source,"negado","","Aguarde pelo menos <b>3 Segundos</b>.",8000)
end)