-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("pma-radio",src)
vCLIENT = Tunnel.getInterface("pma-radio")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEFREQUENCY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.activeFrequency(freq)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if parseInt(freq) >= 1 and parseInt(freq) <= 999 then
			if parseInt(freq) == 1 then
				if vRP.hasPermission(user_id,"admin.permissao") then
					vCLIENT.startFrequency(source,parseInt(1))
					TriggerClientEvent("Notify",source,"sucesso","Entrou na frequência <b>1</b> da <b>Prefeitura</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end
			
			elseif parseInt(freq) == 190 then
				if vRP.hasPermission(user_id,"radio.pm") then
					vCLIENT.startFrequency(source,parseInt(190))
					TriggerClientEvent("Notify",source,"sucesso","Entrou na frequência <b>190</b> da <b>Policia Militar</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end
				
			elseif parseInt(freq) == 193 then
				if vRP.hasPermission(user_id,"radio.bombeiro") then
					vCLIENT.startFrequency(source,parseInt(193))
					TriggerClientEvent("Notify",source,"sucesso","Entrou na frequência <b>190</b> dos <b>Bombeiros</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end
			
			else
				vCLIENT.startFrequency(source,parseInt(freq))
				TriggerClientEvent("Notify",source,"sucesso","Entrou na frequência <b>"..parseInt(freq).."</b>.",8000)
			end
		else
			TriggerClientEvent("Notify",source,"aviso","Frequência não encontrada.",8000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKRADIO
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkRadio()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"radio") >= 1 then
		return true
	else
		TriggerClientEvent("Notify",source,"importante","Você não possui um <b>Rádio</b>.",8000)
		return false
	end
end