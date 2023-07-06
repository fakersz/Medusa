------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local servico = false
local blips = {}
local zonas = {}
local segundos = 0
local selecionado = 0
local quantidade = 0

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INICIAR EMPREGO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local drogas = {
	["Drogas"] = {
		iniciar = vec3(564.57,-1749.05,29.32)
	}
}

Citizen.CreateThread(function()
	while true do
		local time = 1000
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		
		for k,v in pairs(drogas) do
			if not servico then
				local distance = #(playercoords - v.iniciar)
				if distance <= 2.0 then
					time = 5
					DrawText3Ds(v.iniciar[1],v.iniciar[2],v.iniciar[3]-0.1,"Aperte ~y~E~w~ para entrar em serviço.")

					if IsControlJustReleased(1, 51) and segundos <= 0 and checkInService() then
						segundos = 10
						servico = true
						selecionado = 0
						zonas = carregarZonas("Drogas", false)
					end
				end
			end
		end

		Citizen.Wait(time)
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ZONAS DE VENDA
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local time = 1000

		if servico and selecionado >= 1 and segundos <= 0 then
			local ped = PlayerPedId()
			local playercoords = GetEntityCoords(ped)
			
			local distance = #(playercoords - vec3(zonas[selecionado].coords[1],zonas[selecionado].coords[2],zonas[selecionado].coords[3]))
			if distance <= 60.0 then
				time = 5
				DrawMarker(21,zonas[selecionado].coords[1],zonas[selecionado].coords[2],zonas[selecionado].coords[3],0,0,0,0,180.0,130.0,0.3,0.3,0.3,255,255,0,180 ,1,0,0,1)

				if distance <= 1.5 then
					drawTxt("Aperte ~y~E~w~ para entregar a droga",0.5,0.96)
					if IsControlJustReleased(1, 51) and segundos <= 0 and not IsPedInAnyVehicle(PlayerPedId()) then
						if payment("Drogas",5) then
							segundos = 10

							vRP._playAnim(false,{{"mp_common","givetake1_a"}},true)
							TriggerEvent("progress",5,"Vendendo")

							SetTimeout(5*1000, function()
								ClearPedTasks(GetPlayerPed(-1))
								
								selecionado = 0
								quantidade = 0
								RemoveBlip(blips)
							end)
						end
					end
				end
			end
		end

		Citizen.Wait(time)
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EM SERVIÇO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local time = 1000
		if servico then
			time = 5
			drawTxt("~w~Aperte ~r~F7~w~ se deseja finalizar o expediente.\nEntregue as ~y~drogas~w~ pelos ponto mapa.", 0.215,0.94)

			if IsControlJustPressed(0, 168) and not IsPedInAnyVehicle(PlayerPedId()) then
				servico = false
				selecionado = 0
				quantidade = 0
				RemoveBlip(blips)
				sairServico()
			end
		end
		
		Citizen.Wait(time)
	end
end)

Citizen.CreateThread(function()
	while true do
		local time = math.random(15000,50000)

        if servico and quantidade <= 0 then
            selecionado = math.random(38)
            quantidade = math.random(2,6)
            TriggerEvent("Notify","importante","Estamos precisando de <b>"..quantidade.."x</b> dessa sua parada ai., traga o mais rapido possivel!.", 5000)
            CriandoBlip(selecionado)
		end

		Citizen.Wait(time)
	end
end)

Citizen.CreateThread(function()
	while true do
		local time = 1000
		if segundos >= 0 then
			segundos = segundos - 1

			if segundos <= 0 then
				segundos = 0
			end
		end
		Citizen.Wait(time)
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function CriandoBlip(selecionado)
	blips = AddBlipForCoord(zonas[selecionado].coords[1],zonas[selecionado].coords[2],zonas[selecionado].coords[3])
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de Droga")
	EndTextCommandSetBlipName(blips)
end