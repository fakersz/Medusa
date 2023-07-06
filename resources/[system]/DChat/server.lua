-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
 -- ESSE SCRIPT ERA DA QB E EU Dogz1m#6996 COMECEI A CONVERTER E TA AI O PROJETO!!
 -- MAIS SCRIPTS FREE VENHA A DOGZ1M COMMUNITY -> https://discord.gg/GfjD2jxZjf
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("DChat",cRP)

local Config = module('DChat','config')

local admins = {}
local cooldown = {}

-- AddEventHandler('onResourceStart', function(resourceName)
--     if (GetCurrentResourceName() ~= resourceName) then
--       return
--     end
--     clearAuto()
-- end)

RegisterCommand('ilegal', function(source, args, rawCommand)
	local message = rawCommand:sub(8)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	fal = identity.name.. " " .. identity.firstname
	if user_id ~= nil then
		for k, v in pairs(vRP.getUsers()) do
			TriggerClientEvent('chat:addMessage', v, {
				template = '<div style="padding: 0.2vw; margin: 0.2vw; border-radius: 15px 50px 30px 5px;background-image: linear-gradient(to right, rgba(0, 0, 0,0.3) 7%, rgba(0, 0, 0,0) 100%)">👤 <a style="color:#696969;font-weight: bold">Ilegal</a>: {1}</div>',
				args = { fal, message }
			})
		end
		
	end
end)

-- RegisterNetEvent('wais:loadedPlayer', function()
--     local src = source
--     local user_id = vRP.getUserId(src)

--     if not user_id then
--         print('don\'t get permission. Player id:'..src)
--         return
--     end

--     for k,v in pairs(Config['AdminPerm']) do
--         if vRP.hasPermission(src, v) then
--             addAdmin(src, user_id.PlayerData.citizenid)
--             break
--         end  
--     end

-- end)

RegisterNetEvent('wais:setAdmin', function()
    local src = source
    local user_id = vRP.getUserId(src)
    if not user_id then
        print('don\'t get permission. Player id:'..src)
        return
    end
    addAdmin(src, user_id.PlayerData.citizenid)
end)

RegisterNetEvent('wais:gotoPlayer', function(id)
    local src     = source
    local user_id = vRP.getUserId(src)
    
    if vRP.getUserId(id) ~= nil then
        local player = GetPlayerPed(src)
        local zplayer = GetPlayerPed(id)
        local zCoods = GetEntityCoords(zplayer)
        SetEntityCoords(player, zCoods.x, zCoods.y, zCoods.z, 0, 0, 0, 0)
    end
end)

RegisterCommand('rdk', function(source, args)
    local src     = source
    local user_id = vRP.getUserId(src)
    local message = table.concat(args, " ")

    TriggerClientEvent('wais:chatInfo', -1, message, src)
end)


RegisterCommand('report', function(source, args)
    local src     = source
    local user_id = vRP.getUserId(src)
    local steam   = GetPlayerName(src)
    local message = table.concat(args, " ")

    for k = 1, #admins, 1 do
        TriggerClientEvent('wais:chatReport', admins[k].src, steam, src, message)
        Citizen.Wait(1)
    end
    Wait(250)
    TriggerClientEvent('wais:chatInfo', src, "Than you for send report.")
end)

RegisterCommand('clear', function(source)
    local src = source
    if src == 0 then
        print('^8 Clear chat .^0')
        TriggerClientEvent('wais:clearChat', -1)
    else
        local user_id = vRP.getUserId(src)
        if admins[src] ~= nil then
            if admins[src].src then
                TriggerClientEvent('wais:clearChat', -1)
            end
        end
    end
end)

function fix(string)
    string = string.gsub(string, "&", "&amp")
    string = string.gsub(string, "<", "&lt")
    string = string.gsub(string, ">", "&gt")
    string = string.gsub(string, "\"", "&quot")
    string = string.gsub(string, "'", "&#039")
    return string
end

-- function clearAuto()
--     if Config['AutoChatClear'] then
--         SetTimeout(Config['AutoChatClearTime'], function()
--             TriggerClientEvent('wais:clearChat', -1)
--             Citizen.Wait(500)
--             TriggerClientEvent('wais:chatInfo', -1, Config['AutoChatClearMessage'])
--             SetTimeout(1, clearAuto)
--         end)
--     end
-- end



AddEventHandler('playerDropped', function(reason)
    local src = source
    removeAdmin(src)
end)

function addAdmin(src, cid)
    for i = 1, #admins, 1 do
        if admins[i].src == tonumber(src) then
            return
        end
    end
    table.insert(admins, {src = tonumber(src), cid = cid})
end

function removeAdmin(src)
    for i = 1, #admins, 1 do
        if admins[i].src == tonumber(src) then
            table.remove(admins, i)
            return
        end
    end
end 
