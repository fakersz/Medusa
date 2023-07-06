-----------------------------------------------------------------------------------------------------------------------------------------
--[ vRP ]--------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CONEXÃO ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Resg = Tunnel.getInterface("vrp_hospital")
-----------------------------------------------------------------------------------------------------------------------------------------
--[ VARIÁVEIS ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------
--[ REANIMAR ]---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('reanimar')
AddEventHandler('reanimar',function()
	local handle,ped = FindFirstPed()
	local finished = false
	local reviver = nil
	repeat
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),GetEntityCoords(ped),true)
		if IsPedDeadOrDying(ped) and not IsPedAPlayer(ped) and distance <= 1.5 and reviver == nil then
			reviver = ped
			TriggerEvent("cancelando",true)
			vRP._playAnim(false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
			TriggerEvent("progress",15000,"reanimando")
			SetTimeout(15000,function()
				SetEntityHealth(reviver,110)
				local newped = ClonePed(reviver,GetEntityHeading(reviver),true,true)
				TaskWanderStandard(newped,10.0,10)
				local model = GetEntityModel(reviver)
				SetModelAsNoLongerNeeded(model)
				Citizen.InvokeNative(0xAD738C3085FE7E11,reviver,true,true)
				TriggerServerEvent("trydeleteped",PedToNet(reviver))
				vRP._stopAnim(false)
				TriggerServerEvent("reanimar:pagamento")
				TriggerEvent("cancelando",false)
			end)
			finished = true
		end
		finished,ped = FindNextPed(handle)
	until not finished
	EndFindPed(handle)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ MACAS DO HOSPITAL ]------------------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------------------
local macas = {
	{ ['x'] = 1121.46, ['y'] = -1546.97, ['z'] = 34.98, ['x2'] = 1120.38, ['y2'] = -1547.29, ['z2'] = 35.9, ['h'] = 167.0, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 1124.53, ['y'] = -1546.83, ['z'] = 34.98, ['x2'] = 1123.52, ['y2'] = -1547.15, ['z2'] = 35.9, ['h'] = 167.4, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{['x'] = 1127.71, ['y'] = -1546.69, ['z'] = 34.98, ['x2'] = 1126.72, ['y2'] = -1546.96, ['z2'] = 35.9, ['h'] = 167.9, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },	
	
	{ ['x'] = 1126.18, ['y'] = -1538.68, ['z'] = 34.98, ['x2'] = 1127.28, ['y2'] = -1538.39, ['z2'] = 35.9, ['h'] = 07.5, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 1123.24, ['y'] = -1538.33, ['z'] = 34.98, ['x2'] = 1124.28, ['y2'] = -1538.42, ['z2'] = 35.9, ['h'] = 07.4, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 1120.21, ['y'] = -1538.53, ['z'] = 34.98, ['x2'] = 1121.24, ['y2'] = -1538.71, ['z2'] = 35.9, ['h'] = 07.0, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	
	{ ['x'] = 1120.63, ['y'] = -1554.03, ['z'] = 34.98, ['x2'] = 1121.71, ['y2'] = -1553.67, ['z2'] = 35.9, ['h'] = 07.0, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 1123.47, ['y'] = -1553.92, ['z'] = 34.98, ['x2'] = 1124.49, ['y2'] = -1553.79, ['z2'] = 35.9, ['h'] = 07.0, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 1126.38, ['y'] = -1553.65, ['z'] = 34.98, ['x2'] = 1127.31, ['y2'] = -1553.79, ['z2'] = 35.9, ['h'] = 07.0, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },

	{ ['x'] = 1127.39, ['y'] = -1561.7, ['z'] = 34.98, ['x2'] = 1126.47, ['y2'] = -1562.26, ['z2'] = 35.9, ['h'] = 167.0, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 1124.67, ['y'] = -1562.13, ['z'] = 34.98, ['x2'] = 1123.71, ['y2'] = -1562.17, ['z2'] = 35.9, ['h'] = 167.4, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 1121.95, ['y'] = -1562.05, ['z'] = 34.98, ['x2'] = 1121.04, ['y2'] = -1562.12, ['z2'] = 35.9, ['h'] = 167.9, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },	
	
}
-----------------------------------------------------------------------------------------------------------------------------------------
--[ USO ]-------------------------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------------------
local emMaca = false
Citizen.CreateThread(function()
	while true do
		local idle = 1000
		for k,v in pairs(macas) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local cod = macas[k]

			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cod.x, cod.y, cod.z, true ) < 1.2 then
				
				DrawText3D(cod.x, cod.y, cod.z, cod.texto)
			end

			if distance < 1.2 then

				idle = 5

				if IsControlJustPressed(0,38) then
					SetEntityCoords(ped,v.x2,v.y2,v.z2)
					SetEntityHeading(ped,v.h)
					vRP._playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a"}},true)
					emMaca = true
				end

				if IsControlJustPressed(0,47) then
					if Resg.checkServices() then
						TriggerEvent('tratamento-macas')
						TriggerEvent('resetDiagnostic')
						TriggerEvent('resetWarfarina')
						SetEntityCoords(ped,v.x2,v.y2,v.z2)
						SetEntityHeading(ped,v.h)
						vRP._playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a"}},true)
					else
						TriggerEvent("Notify","aviso","Existem paramédicos em serviço.")
					end
				end

			end

			if IsControlJustPressed(0,167) and emMaca then
				ClearPedTasks(GetPlayerPed(-1))
				emMaca = false
			end
		end

		Citizen.Wait(idle)
	end
end)

RegisterNetEvent('tratamento-macas')
AddEventHandler('tratamento-macas',function()
	TriggerEvent("cancelando",true)
	repeat
		SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId())+7)
		Citizen.Wait(2000)
	until GetEntityHealth(PlayerPedId()) >= 400 or GetEntityHealth(PlayerPedId()) <= 100
	TriggerEvent("Notify","importante","Tratamento concluido.")
	TriggerEvent("cancelando",false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ TRATAMENTO ]-------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local tratamento = false
RegisterNetEvent("tratamento")
AddEventHandler("tratamento",function()
    local ped = PlayerPedId()
    local health = GetEntityHealth(ped)
    local armour = GetPedArmour(ped)

    SetEntityHealth(ped,health)
    SetPedArmour(ped,armour)
	
	if emMaca then
		if tratamento then
			return
		end

		tratamento = true
		TriggerEvent("Notify","sucesso","Tratamento iniciado, aguarde a liberação do <b>profissional médico.</b>.",8000)
		TriggerEvent('resetWarfarina')
		TriggerEvent('resetDiagnostic')
		

		if tratamento then
			repeat
				Citizen.Wait(600)
				if GetEntityHealth(ped) > 101 then
					SetEntityHealth(ped,GetEntityHealth(ped)+1)
				end
			until GetEntityHealth(ped) >= 240 or GetEntityHealth(ped) <= 101
				TriggerEvent("Notify","sucesso","Tratamento concluido.",8000)
				tratamento = false
		end
	else
		TriggerEvent("Notify","negado","Você precisa estar deitado em uma maca para ser tratado.",8000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÕES ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end