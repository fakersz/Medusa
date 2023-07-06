
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vSERVER = Tunnel.getInterface(GetCurrentResourceName())

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "fechar" then
 		ToggleActionMenu()
 	end
end)

RegisterNUICallback("finalizando",function(data)
	vSERVER.buyCart(data.cart)
	ToggleActionMenu()

end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	vec3(1692.62,3759.50,34.70),
	vec3(252.89,-49.25,69.94),
	vec3(843.28,-1034.02,28.19),
	vec3(-331.35,6083.45,31.45),
	vec3(-663.15,-934.92,21.82),
	vec3(-1305.18,-393.48,36.69),
	vec3(-1118.80,2698.22,18.55),
	vec3(2568.83,293.89,108.73),
	vec3(-3172.68,1087.10,20.83),
	vec3(21.32,-1106.44,29.79),
	vec3(811.19,-2157.67,29.6),
}

Citizen.CreateThread(function()
	while true do
	local idle = 1000
		if not menuactive then 
			local ped = PlayerPedId()
			local pCords = GetEntityCoords(ped)
			for i = 1,#marcacoes do 
				local distance = #(pCords - marcacoes[i])
				if distance < 10 then 
					DrawMarker(27,marcacoes[i].x,marcacoes[i].y,marcacoes[i].z-0.97,0,0,0,0,180.0,130.0,0.5,0.5,0.5,160, 14, 14,100,0,0,0,0)
					idle = 3
					if distance < 2.0 then 
						DrawText3Ds(marcacoes[i].x,marcacoes[i].y,marcacoes[i].z,"~r~APERTE~w~ ~g~[E]~w~ | Acessar a Ammu nation")
						if IsControlJustPressed(0,38) then
							ToggleActionMenu()
						end
					end
				end
			end 
		end
		Wait(idle)
	end
end)

function DrawText3Ds(x,y,z,text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    SetTextScale(0.34, 0.34)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370 +0.02
    DrawRect(_x,_y+0.0125, 0.001+ factor, 0.028, 0, 0, 0, 78)
end
