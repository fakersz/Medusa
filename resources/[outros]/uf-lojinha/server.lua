
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vCLIENT = Tunnel.getInterface(GetCurrentResourceName())
mapreedev = {}
Tunnel.bindInterface(GetCurrentResourceName(), mapreedev)

function mapreedev.buyCart(cart)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        for k,v in pairs(cart) do
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.set)*v.qt <= vRP.getInventoryMaxWeight(user_id) then
                if vRP.tryFullPayment(user_id,parseInt(v.price*v.qt)) then
                    TriggerClientEvent("Notify",source,"sucesso","Comprou <b>"..parseInt(v.qt).."x "..vRP.itemNameList(v.set).."</b> por <b>$"..vRP.format(parseInt(v.price*v.qt)).." dólares</b>.")
                        vRP.giveInventoryItem(user_id,v.set,parseInt(v.qt))
                else
                    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
                end
            else
                TriggerClientEvent("Notify",source,"negado","Espaço insuficiente.")
            end
        end
    end
end