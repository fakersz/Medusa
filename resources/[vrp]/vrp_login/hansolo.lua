local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ FUNCTION ]---------------------------------------------------------------------------------------------------------------------------

local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
		StartScreenEffect("MenuMGSelectionIn", 0, true)
	else
		StopScreenEffect("MenuMGSelectionIn")
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
--[ BUTTON ]-----------------------------------------------------------------------------------------------------------------------------

RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "policia" then
		vRP.teleport(-1112.42,-824.39,19.32)
	elseif data == "hospital" then
		vRP.teleport(-1868.04,-358.06,49.4)
	elseif data == "garagem" then
		vRP.teleport(58.5,-874.04,30.45)
	elseif data == "sandy" then
		vRP.teleport(319.5,2626.58,44.44)
	elseif data == "paleto" then
		vRP.teleport(-772.91,5596.06,33.49)
	end
	ToggleActionMenu()
	TriggerEvent("ToogleBackCharacter")
	TriggerEvent("status:hud",false)
end)

RegisterCommand("tlogin",function(source,args)
	ToggleActionMenu()
end)

--[ TOOGLE LOGIN ]-----------------------------------------------------------------------------------------------------------------------

RegisterNetEvent('vrp:ToogleLoginMenu')
AddEventHandler('vrp:ToogleLoginMenu',function()
	ToggleActionMenu()
end)