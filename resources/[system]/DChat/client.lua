
    
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('wais:loadedPlayer')
end)

RegisterNetEvent('QBCore:Client:OnPermissionUpdate', function()
    TriggerServerEvent('wais:setAdmin')
end)

RegisterKeyMapping('+chat', 'Open chat', 'keyboard', 't')
RegisterCommand('+chat', function()SetNuiFocus(true, true)SendNUIMessage({type = "openChat"})end)

AddEventHandler('onClientResourceStart', function(resName)
    if (GetCurrentResourceName() ~= resName) then
        return
    end
    Wait(500)
    refreshCommands()
    TriggerServerEvent('wais:loadedPlayer')
end)

--#event 
exports('addMessage', addMessage)
RegisterNetEvent('chat:addMessage')
AddEventHandler('chat:addMessage', addMessage)

local addMessage = function(message)
    if type(message) == 'string' then
      message = {
        args = { message }
      }
    end
  
    SendNUIMessage({
      type = 'ON_MESSAGE',
      message = message
    })
end


  
-----------------------------------------------------------------------------------------
-- NUI Callbacks --
-----------------------------------------------------------------------------------------

RegisterNUICallback('close', function()
    SetNuiFocus(false, false) 
    SendNUIMessage({type = "closeChat"})
end)

RegisterNUICallback('sendmessage', function(data, cb)
    SetNuiFocus(false, false) 
    SendNUIMessage({type = "closeChat"})

    if data.message:sub(1, 1) == '/' then
        ExecuteCommand(data.message:sub(2))
        cb(true)
    else
        cb(false)
    end
end)

RegisterNUICallback('sendInfo', function()
    TriggerEvent('wais:chatInfo', "Number copied successfuly.")
end)

RegisterNUICallback('gotoPlayer', function(data)
    TriggerServerEvent('wais:gotoPlayer', data.id)
end)

-----------------------------------------------------------------------------------------
-- Events --
-----------------------------------------------------------------------------------------

RegisterNetEvent('wais:clearChat', function()
    SendNUIMessage({
        type = "clearAll"
    })
end)

RegisterNetEvent('wais:chatReport', function(name, id, message)
    SendNUIMessage({
        type  = "report",
        steam = name,
        id    = id,
        text  = message
    })
end)



RegisterNetEvent('wais:chatMe', function(fName, lName, id, text)
    SendNUIMessage({
        type  = "me",
        fName = fName,
        lName = lName,
        id    = id,
        text  = text
    })
end)

RegisterNetEvent('wais:chatDo', function(fName, lName, id, text)
    SendNUIMessage({
        type  = "do",
        fName = fName,
        lName = lName,
        id    = id,
        text  = text
    })
end)

RegisterNetEvent('wais:chatOoc', function(fName, lName, id, text)
    SendNUIMessage({
        type  = "ooc",
        fName = fName,
        lName = lName,
        id    = id,
        text  = text
    })
end)

RegisterNetEvent('wais:chatJobs', function(job, fName, lName, id, text)
    if vRP.GetPlayerData().job.name == job then
        SendNUIMessage({
            type  = "job",
            job   = job,
            fName = fName,
            lName = lName,
            id    = id,
            text  = text
        })
    end
end)

RegisterNetEvent('wais:chatError', function(fName, lName, id, text)
    SendNUIMessage({
        type  = "error",
        fName = fName,
        lName = lName,
        id    = id,
        text  = text
    })
end)

RegisterNetEvent('wais:addRedaksiyon', function(fName, lName, phone, text, steam, id)
    SendNUIMessage({
        type = "redaksiyon",
        fName = fName,
        lName = lName,
        phone = phone,
        text  = text,
        steam = steam,
        id    = id
    })
end)

-----------------------------------------------------------------------------------------
-- Functions --
-----------------------------------------------------------------------------------------
 
function refreshCommands()
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()
        local suggestions = {}
  
        if Config.UseQuickCommands then
            for k,v in pairs(Config.QuickCommands) do
                table.insert(suggestions, {
                    name = '/' .. v
                })
            end
        end

        for _, command in ipairs(registeredCommands) do
            if IsAceAllowed(('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name
                })
            end
        end

        SendNUIMessage({
            type = "addCommands",
            commands = suggestions
        })
    end
end

Citizen.CreateThread(function() 
    SetTextChatEnabled(false)
end)