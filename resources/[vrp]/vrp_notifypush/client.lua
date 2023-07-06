-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
func = Tunnel.getInterface("vrp_notifypush")
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("notify3",function(source,args)
	if func.checkPermission() then 
		SetNuiFocus(true,true)
		SendNUIMessage({ action = "showAll" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("notify3","Abrir as notificações","keyboard","f3")
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFYPUSH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("NotifyPush")
AddEventHandler("NotifyPush",function(data)
	PlaySoundFrontend(-1,"Event_Message_Purple","GTAO_FM_Events_Soundset",false)
	data.loc = GetStreetNameFromHashKey(GetStreetNameAtCoord(data.x,data.y,data.z))
	data.title = data.text
	if data.title == nil then
		data.title = 'Sem descrição'
	end

	SendNUIMessage({ action = "notify", data = data })

	local blip = AddBlipForCoord(data.x,data.y,data.z)
	SetBlipSprite(blip,304)
	SetBlipAsShortRange(blip,true)
	SetBlipColour(blip,5)
	SetBlipScale(blip,0.8)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(data.title)
	EndTextCommandSetBlipName(blip)
	SetTimeout(60000,function()
		RemoveBlip(blip)
	end)
end)

RegisterCommand("test",function(source,args,rawCommand)
			TriggerEvent("NotifyPush",{ code = 20, title = "Tráfico", text = "Denúncia de venda de drogas", x = 1 ,y = 2 , z = 3 , rgba = {140,35,35} })
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FOCUSON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("focusOn",function()
    SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FOCUSOFF
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("focusOff",function()
    SetNuiFocus(false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("setWay",function(data)
    SetNewWaypoint(data.x+0.0001,data.y+0.0001)
end)