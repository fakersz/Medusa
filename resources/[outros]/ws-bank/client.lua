local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

ws = Tunnel.getInterface(GetCurrentResourceName())

BancoAberto = false


local sServer = Tunnel.getInterface(GetCurrentResourceName())


CreateThread(function()
    Wait(2000)
    loadScripts()
end)

function loadScripts()
    CreateThread(function()

        while true do
            sleep = 1000
            local ped = PlayerPedId()
            local pCDS = GetEntityCoords(ped)
            for k,v in pairs(Agencias) do 
                local distance = #(pCDS - vector3(v.x,v.y,v.z))
                if distance <= 3 then
                    sleep = 4
                    DrawMarker(29, v.x,v.y,v.z-0.7,0,0,0,0,0,0,0.2,0.2,0.3,255, 140, 0,255,0,0,0,1)
                    DrawMarker(27, v.x,v.y,v.z-1,0,0,0,0,0,0,0.4,0.4,0.5,255, 140, 0,255,0,0,0,1)
                end
            end
            Wait(sleep)
        end
    end)
end

RegisterKeyMapping('abrirbanco','Abrir o Banco','keyboard', 'E')
RegisterCommand('abrirbanco', function()

    for k,v in pairs(Agencias) do
        local ped = PlayerPedId()
        local pCDS = GetEntityCoords(ped)
        local distance = #(pCDS - vector3(v.x,v.y,v.z))
        if distance <= 1.5 then
          
                if BancoAberto == false then
                    BancoAberto = true
                    local carteira,banco = ws.GetMoneySystem()
                    local carteira2,banco2,pix = ws.ConsultPlayer()
                    if carteira == nil then
                        carteira = 0
                    end
            
                    SendNUIMessage({ action = 'opensystem', banco = banco, carteira = carteira, pix = pix })
                    SetNuiFocus(true, true)
                    TransitionToBlurred(true)
                end

        end
    end
end)

RegisterNUICallback('fecharbanco',function(data,cb)

    BancoAberto = false
    SendNUIMessage({ action = 'closesystem'})
    SetNuiFocus(false, false)

    TransitionFromBlurred(1000)
end)


RegisterNUICallback('pix', function(data, cb)

    local cart,bank,pix = ws.ConsultPlayer()
    if data.type == "create" then
        if pix == nil then
            local carteira,banco,pix = ws.ConsultPlayer()
            if ws.CreatePix(data.param) then
                SendNUIMessage({ action = 'updatepix', retorno = data.param})
            end
        else
            TriggerEvent("bank:notify","negado","Você já tem uma chave pix registrada","PIX")
        end

    elseif data.type == "delete" then
        if pix then
            local carteira,banco,pix = ws.ConsultPlayer()
            if ws.DeletePix(pix) then
                -- print('2')
                SendNUIMessage({ action = 'updatepix', retorno = nil})
            end
        else
            TriggerEvent("bank:notify","negado","Você não tem uma chave pix!","PIX")
        end

    elseif data.type == "edit" then
        if pix then
            local carteira,banco,pix = ws.ConsultPlayer()
            if ws.EditPix(pix,data.param) then
                SendNUIMessage({ action = 'updatepix', retorno = data.param})
            end
        else
            TriggerEvent("bank:notify","negado","Você não tem uma chave pix!","PIX")
        end
    elseif data.type == "send" then
        if pix then
            if ws.SendPix(data.key,data.value) then
                
                cb({retorno = 'sucesso'})
                -- SendNUIMessage({ action = 'updatepix', retorno = data.param})
            end
        else
            TriggerEvent("bank:notify","negado","Você não tem uma chave pix!","PIX")
        end
    end
end)

RegisterNUICallback('money', function(data, cb)
	if data.type == "drop" then 
        if data.param or data.param > 0 then
            if ws.DropMoney(data.param) then
                local carteira,banco = ws.GetMoneySystem()
                SendNUIMessage({action = 'updateaccount', wallet = carteira, bank = banco})
                cb({retorno = 'sucesso', valor = data.param})
            end
        end

	elseif data.type == "deposit" then 
        if data.param  or data.param > 0 then
            if ws.DepositMoney(data.param) then
                local carteira,banco = ws.GetMoneySystem()
                SendNUIMessage({action = 'updateaccount', wallet = carteira, bank = banco})
                cb({retorno = 'depositar', valor = data.param})
            end
        end

	elseif data.type == "express" then 
        if ws.ExpressMoney() then
            local carteira,banco = ws.GetMoneySystem()
            SendNUIMessage({action = 'updateaccount', wallet = carteira, bank = banco})
            cb({retorno = '1000'})
        end
    elseif data.type == "send" then
        if data.id then
            if ws.Send(data.id,data.value) then
                local carteira,banco = ws.GetMoneySystem()
                SendNUIMessage({action = 'updateaccount', wallet = carteira, bank = banco})
                cb({retorno = 'ted', valor = data.value})
            end
        else
            TriggerEvent("bank:notify","negado","Você não expecificou o passaporte!","Negado")
        end
    end
end)

RegisterNUICallback('multas', function(data, cb)
    
    if data.type == "consultar" then
        local multas = ws.ConsultarMultas()
        cb({result = multas})
    elseif data.type == "pagar" then
        if ws.payMultas(data.id,data.valor) then
            local carteira,banco = ws.GetMoneySystem()
            SendNUIMessage({action = 'updateaccount', wallet = carteira, bank = banco})
            cb({message = 'sucesso'})
        end
    elseif data.type == "apply" then
        if ws.ApplyTicket(data.id,data.value,data.reason,data.desc) then
        end
    end
end)

RegisterCommand("pix", function()
    local carteira,banco,pix = ws.ConsultPlayer()
    if pix ~= nil then
        if not BancoAberto then
            BancoAberto = true
            SendNUIMessage({action = 'showpix'})
            SetNuiFocus(true, true)
            TransitionToBlurred(true)
        else
            TriggerEvent("bank:notify","negado","Você não pode fazer isso com banco aberto!","PIX")
        end
    else
        TriggerEvent("bank:notify","negado","Você não tem uma chave pix!","PIX")
    end
end)

RegisterCommand("multar", function()
    if ws.CheckPolicePermission() then
        SendNUIMessage({action = 'showpolice'})
        SetNuiFocus(true, true)
        TransitionToBlurred(true)
    end
end)


RegisterNUICallback("clearTrans", function(data,cb)
    if ws.ClearTrans() then
        cb({retorno = 'sucesso'})
    end
end)

RegisterNUICallback("getGraphic",function(data,cb)

    local mult = ws.ConsultarMultas()
    local dados = ws.getExtract()
    SendNUIMessage({action = 'Graphic', dados = ws.getExtract()})
end)

--VISUAL

-- TriggerClientEvent("bank:notify",source,"negado"," não tem dinheiro","Negado")
RegisterNetEvent("bank:notify")
AddEventHandler("bank:notify",function(type,text,title)
    if type == 'sucesso' then
        SendNUIMessage({action = 'notify', icon = 'M14.1 27.2l7.1 7.2 16.7-16.8', type = type ,texto = text, titulo = title})
    else
        SendNUIMessage({action = 'notify', icon = 'M16 16 36 36 M36 16 16 36', type = type ,texto = text, titulo = title})
    end
end)


-- TriggerClientEvent("bank:recebimentos", nuser_id,"PIX",args)
RegisterNetEvent("bank:recebimentos")
AddEventHandler("bank:recebimentos",function(text,valor)
    SendNUIMessage({action = 'recebimentos',text = text, valor = valor})
end)

RegisterNetEvent("bank:saidas")
AddEventHandler("bank:saidas",function(valor)
    SendNUIMessage({action = 'saidas', valor = valor})
end)

function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/370
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,80)
end