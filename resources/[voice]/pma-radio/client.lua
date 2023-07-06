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
vSERVER = Tunnel.getInterface("pma-radio")
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("invClose",function(data)
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "hideMenu" })
	vRP._DeletarObjeto(source)
	vRP.DeletarObjeto()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /INV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("radio","Abrir radio PMA","keyboard","INSERT")
RegisterCommand("radio",function(source,args)
	if GetEntityHealth(GetPlayerPed(-1)) > 101 and vSERVER.checkRadio() then
		if not IsPedInAnyVehicle(PlayerPedId()) then
			vRP._CarregarObjeto("cellphone@","cellphone_text_in","prop_cs_hand_radio",50,28422)
			SetNuiFocus(true,true)
			SendNUIMessage({ action = "showMenu" })
		else
			SetNuiFocus(true,true)
			SendNUIMessage({ action = "showMenu" })
			vRP._CarregarObjeto("cellphone@","cellphone_text_in","prop_cs_hand_radio",50,28422)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEFREQUENCY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("activeFrequency",function(data)
	if parseInt(data.freq) >= 1 and parseInt(data.freq) <= 999 then
		vSERVER.activeFrequency(data.freq)
		TriggerEvent("vrp_sound:source",'click-radio',1.0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEFREQUENCY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("inativeFrequency",function(data)
	TriggerEvent("radio:outServers")
	TriggerEvent("Notify","importante","Você saiu de todas as frequências.",8000)
	TriggerEvent("vrp_sound:source",'click-radio',1.0)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTFREQUENCY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.startFrequency(frequency)
	TriggerEvent("radio:outServers")
	exports["pma-voice"]:SetRadioChannel(frequency)
	exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OUTSERVERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("radio:outServers")
AddEventHandler("radio:outServers",function()
	exports["pma-voice"]:SetRadioChannel(0)
	exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
end)

local isBroadcasting = false

AddEventHandler('pma-voice:radioActive', function(broadCasting)
	isBroadcasting = broadCasting
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local broadcastDictionary = "random@arrests"
		local broadcastAnimation = "generic_radio_chatter"
		local isPlayingBroadcastAnim = IsEntityPlayingAnim(playerPed, broadcastDictionary, broadcastAnimation, 3)
		if isBroadcasting and not isPlayingBroadcastAnim then
			RequestAnimDict(broadcastDictionary)
			while not HasAnimDictLoaded(broadcastDictionary) do
				Citizen.Wait(150)
			end
			TaskPlayAnim(playerPed, broadcastDictionary, broadcastAnimation, 8.0, 0.0, -1, 49, 0, 0, 0, 0)                    
			local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,0.0,-5.0)
			object = CreateObject(GetHashKey('prop_cs_hand_radio'),coords.x,coords.y,coords.z,true,true,true)
			SetEntityCollision(object,false,false)
			AttachEntityToEntity(object,PlayerPedId(),GetPedBoneIndex(PlayerPedId(),60309),0.06,0.05,0.03,-90.0,30.0,0.0,false,false,false,false,2,true)
			SetTimeout(10000,function()
				DeleteObject(object)
			end)
		elseif not isBroadcasting and isPlayingBroadcastAnim then
			StopAnimTask(playerPed, broadcastDictionary, broadcastAnimation, -4.0)
			DeleteObject(object)
		end
	end
end)

AddEventHandler("onClientResourceStart", function(resName)
	if GetCurrentResourceName() ~= resName and "pma-voice" ~= resName then
		return
	end
	exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
end)