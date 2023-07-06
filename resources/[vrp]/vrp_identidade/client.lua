-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
vRP = Proxy.getInterface("vRP")
vRPNserver = Tunnel.getInterface("vrp_identidade")
-----------------------------------------------------------------------------------------------------------------------------------------
-- IDENTIDADE
-----------------------------------------------------------------------------------------------------------------------------------------
local identity = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if IsControlJustPressed(0,344) and GetEntityHealth(PlayerPedId()) > 101 then
			if identity then
				identity = false
				SendNUIMessage({ type = 'close' })
			else
				local carteira,banco,nome,sobrenome,idade,user_id,identidade,telefone,job,cargo,vip,multas,faturas,telefone = vRPNserver.Identidade()
				--local carteira,banco,paypal,nome,sobrenome,idade,user_id,identidade,telefone,job,cargo,vip,multas,faturas,telefone = vRPNserver.Identidade()
				local anim1 = "amb@world_human_stand_mobile@female@text@enter"
		        RequestAnimDict(anim1)
		        TaskPlayAnim(GetPlayerPed(-1), anim1, "enter", 8.0, 1.0, -1, 50, 0, 0, 0, 0)
		        Citizen.Wait(1000)
		        vRP._CarregarObjeto("amb@world_human_stand_mobile@female@text@base","base","p_ld_id_card_01",49,28422)
		        identity = true
				SendNUIMessage({
					type = 'open',
					nome = nome,
					sobrenome = sobrenome,
					carteira = carteira,
					banco = banco,
					vip = vip,
					emprego = job,
					cargo = cargo,
					id = user_id,
					documento = identidade,
					idade = idade,
					--paypal = paypal,
					telefone = telefone,
					multas = multas,
				})
				identity = true
			end
		end
	end
end)