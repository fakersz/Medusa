
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
	vec3(25.65,-1346.58,29.49-0.95),
	vec3(2556.75,382.01,108.62-0.95),
	vec3(1163.54,-323.04,69.20-0.95),
	vec3(-707.37,-913.68,19.21-0.95),
	vec3(-47.73,-1757.25,29.42-0.95),
	vec3(373.90,326.91,103.56-0.95),
	vec3(-3243.10,1001.23,12.83-0.95),
	vec3(1729.38,6415.54,35.03-0.95),
	vec3(547.90,2670.36,42.15-0.95),
	vec3(1960.75,3741.33,32.34-0.95),
	vec3(2677.90,3280.88,55.24-0.95),
	vec3(-2550.59,2316.66,33.21),
	vec3(1159.7585449219,-157.5366973877,56.696109771729),
	vec3(309.69134521484,-585.54058837891,42.284057617188),
	vec3(1698.45,4924.15,42.06-0.95),
	vec3(-1820.93,793.18,138.11-0.95),
	vec3(1392.46,3604.95,34.98-0.95),
	vec3(-2967.82,390.93,15.04-0.95),
	vec3(235.27433776855,-1078.4874267578,36.133007049561),
	vec3(-3040.10,585.44,7.90-0.95),
	vec3(1135.56,-982.20,46.41-0.95),
	vec3(1165.91,2709.41,38.15-0.95),
	vec3(-1487.18,-379.02,40.16-0.95),
	vec3(-1222.78,-907.22,12.3-0.95),
	vec3(-433.24954223633,-341.42681884766,34.910743713379),
	vec3(805.45599365234,-885.48345947266,29.250856399536),
	vec3(2016.44921875,716.91998291016,203.67129516602),
	vec3(1483.9045410156,-69.171852111816,141.52766418457),
	vec3(1815.5014648438,3390.2497558594,42.748138427734),
	vec3(-805.14489746094,327.82266235352,243.22470092773)
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
					DrawMarker(27,marcacoes[i],0,0,0,0,180.0,130.0,0.5,0.5,0.5,160, 14, 14,100,0,0,0,0)
					idle = 3
					if distance < 2.0 then 
						DrawText3Ds(marcacoes[i].x,marcacoes[i].y,marcacoes[i].z +1.25,"~r~APERTE~w~ ~g~[E]~w~ | Acessar a Loja")
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
