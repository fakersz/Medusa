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
Tunnel.bindInterface("dm_chest",src)
vSERVER = Tunnel.getInterface("dm_chest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local chestTimer = 0
local chestOpen = ""
local trava = false
local timertrava = 0	
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("chestClose",function(data)
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "hideMenu" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("takeItem",function(data)
	if not trava then
		vSERVER.takeItem(tostring(chestOpen),data.item,data.amount)
		trava = true
		timertrava = 0
	else
		TriggerServerEvent("travas",source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("storeItem",function(data)
	if not trava then
		vSERVER.storeItem(tostring(chestOpen),data.item,data.amount)
		trava = true
		timertrava = 0
	else
		TriggerServerEvent("travas",source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- AUTO-UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Creative:UpdateChest")
AddEventHandler("Creative:UpdateChest",function(action)
	SendNUIMessage({ action = action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestChest",function(data,cb)
	local inventario,inventario2,peso,maxpeso,peso2,maxpeso2 = vSERVER.openChest(tostring(chestOpen))
	if inventario then
		cb({ inventario = inventario, inventario2 = inventario2, peso = peso, maxpeso = maxpeso, peso2 = peso2, maxpeso2 = maxpeso2 })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local chest = {
	{ "Policia", -2034.55, -462.72, 11.42 },
	{ "Hospital", 308.86, -562.39, 43.29 }, 
	{ "Mecanico", -203.94, -1341.57, 34.9 },
	{ "Mecanico2", 841.48, -980.82, 32.08 },	
	{ "Cv", 1363.94,-259.74,152.53 },
	{ "Tcp", 1442.28, -763.11, 87.74 },
	{ "Pcc", 678.03, -311.17, 60.73 }, 	
	{ "Yakuza", -867.38, -1458.11, 7.53 }, 
	{ "Melicia", -155.76, -1604.34, 35.05 }, 
	{ "Ada", -1886.39, 2062.47, 140.99 }, 
	{ "Crips", -619.86, -1617.86, 33.02 },
	{ "Bloods", 563.51, -3126.97, 18.77 },
	{ "Camorra", -1109.62, -1640.91, 4.65 },
	{ "Bahamas", -1365.46, -617.0, 30.32 },
	{ "Vanilla", 106.75, -1299.21, 28.77 },
	{ "Hellangels", 479.18, -1326.34, 29.21 },
	{ "Motoclub", 977.13, -104.25, 74.85 },
	{ "Advogado", 247.51, -1100.21, 36.14 },
	{ "Mafia", 1391.57, 1158.81, 114.34 },
	{ "Staff", 1114.24, -648.84, 57.75 },
	


}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTTIMER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		if chestTimer > 0 then
			chestTimer = chestTimer - 3
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if timertrava > 0 then
			timertrava = timertrava - 1
		else
			trava = false 
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		--Citizen.Wait(1)
		sleep = 1000	
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))
		for k,v in pairs(chest) do
			local distance = Vdist(x,y,z,v[2],v[3],v[4])
			if distance <= 10.0 then
			sleep = 5
				if distance <= 5.0 then
					draw3DText(v[2],v[3],v[4],"~w~[E] -~r~ [Bau]~w~")
					if distance <= 1 and IsControlJustPressed(1, 38) then
						chestTimer = 3
						if vSERVER.checkIntPermissions(v[1]) then
							SetNuiFocus(true,true)
							SendNUIMessage({ action = "showMenu" })
							chestOpen = v[1]
						end
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT
-----------------------------------------------------------------------------------------------------------------------------------------
function draw3DText(x,y,z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
  end