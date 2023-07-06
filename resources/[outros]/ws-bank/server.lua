local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

ws = {}
Tunnel.bindInterface(GetCurrentResourceName(), ws)




vRP.prepare("ConsultBank", "SELECT * FROM vrp_user_moneys WHERE user_id = @user_id")
vRP.prepare("ConsultMoneyBank", "SELECT bank FROM vrp_user_moneys WHERE user_id = @user_id")
vRP.prepare("UpdateMoneyBank", "UPDATE vrp_user_moneys SET bank = @bank WHERE user_id = @user_id")
vRP.prepare("ConsultPix", "SELECT * FROM vrp_user_moneys WHERE pix = @pix")
vRP.prepare("UpdateBankPix", "UPDATE vrp_user_moneys SET pix = @pix WHERE user_id = @user_id")
vRP.prepare("GiveTrafficTicket", "INSERT INTO vrp_multas (user_id,valor,motivo,data,descricao) VALUES (@user_id, @valor, @motivo, @data, @descricao)")
vRP.prepare("SearchTrafficTicket", "SELECT * FROM vrp_multas WHERE user_id = @user_id")
vRP.prepare("PayTrafficTicket", "DELETE FROM vrp_multas WHERE id = @id ")
vRP.prepare("getUserExtract", "SELECT * FROM vrp_user_extracts WHERE user_id = @user_id")
vRP.prepare("insertUserExtract","INSERT INTO vrp_user_extracts (user_id,valor,descricao,text) VALUES (@user_id,@valor,@descricao,@text)")
vRP.prepare("DeleteUserExtract","DELETE FROM vrp_user_extracts WHERE user_id = @user_id")

function ws.ClearTrans()

    local source = source
    local user_id = vRP.getUserId(source)

    -- print(user_id)
    if user_id then

        vRP.execute("DeleteUserExtract",{user_id = user_id})
        return true
    end


end

function ws.getExtract()
    
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local total = {}
        local extrato = vRP.query("getUserExtract", {user_id = user_id})
        if extrato[1] then
            for k,v in pairs(extrato) do
                table.insert(total,{Valor = v.valor, Desc = v.descricao, Text = v.text})
            end
            return total
       end
    end
end

function ws.CreatePix(args)

    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local chave = vRP.query("ConsultPix", {pix = args})
        if chave[1] == nil then
            vRP.execute("UpdateBankPix", {pix = args, user_id = user_id})
            TriggerClientEvent("bank:notify",source,"sucesso","Você criou sua chave pix com sucesso!","PIX")
            return true
        else
            TriggerClientEvent("bank:notify",source,"negado","Já existe uma chave pix com esses dados","PIX")
        end
    end
end

function ws.EditPix(args,new)

    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local chave = vRP.query("ConsultPix", {pix = new})
        if not chave[1] then
            vRP.execute("UpdateBankPix", {pix = new, user_id = user_id})
            TriggerClientEvent("bank:notify",source,"sucesso","Você editou sua chave pix com sucesso!","PIX")
            return true
        else
            TriggerClientEvent("bank:notify",source,"negado","Já existe uma chave pix com esses dados","PIX")
        end
    end
end

function ws.DeletePix(args)

    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local chave = vRP.query("ConsultPix", {pix = args})
        if chave[1] ~= nil then
            vRP.execute("UpdateBankPix", {pix = nil, user_id = user_id})
            TriggerClientEvent("bank:notify",source,"sucesso","Você deletou sua chave pix!","PIX")
            return true 
        else
            TriggerClientEvent("bank:notify",source,"negado","Você não tem uma chave pix!","PIX")
        end
    end
end

function ws.SendPix(key,valor)

    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local chave = vRP.query("ConsultPix", {pix = key})
        if chave[1] then

            local nuser_id = vRP.getUserSource(chave[1].user_id)

            local banco = parseInt(vRP.getBankMoney(user_id))
            local nBanco = parseInt(vRP.getBankMoney(nuser_id))

            if nuser_id then
                if user_id ~= nuser_id then
                    if parseInt(valor) <= banco then
                        vRP.setBankMoney(user_id,banco-parseInt(valor))
                        vRP.setBankMoney(nuser_id,nBanco+parseInt(valor))

                        
                        TriggerClientEvent("bank:notify",source,"sucesso","Você enviou R$:"..parseInt(valor).." para o pix "..key.." !","PIX")
                        TriggerClientEvent("bank:notify",nuser_id,"sucesso","Você recebeu R$:"..parseInt(valor).." no pix!","PIX")
                        TriggerClientEvent("bank:recebimentos",nuser_id,"PIX","RECEBIMENTO PIX")
                        vRP.execute("insertUserExtract",{user_id = user_id, valor = parseInt(valor), descricao = 'saida', text = 'PIX'})
                        vRP.execute("insertUserExtract",{user_id = nuser_id, valor = parseInt(valor), descricao = 'entrada', text = 'PIX'})
                        
                        return true
                    end
                else
                    TriggerClientEvent("bank:notify",source,"negado","passaporte inválido ou inexistente!","Negado")
                end
            else
                TriggerClientEvent("bank:notify",source,"negado","Não encontramos essa pessoa no radar!","Negado")
            end
        else
            TriggerClientEvent("bank:notify",source,"negado","chave pix inválida ou inexistente!","Negado")
        end
    end
end

function ws.DropMoney(args)

    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local BankMoney = parseInt(vRP.getBankMoney(user_id))
        if parseInt(args) <= BankMoney then
            vRP.tryWithdraw(user_id,parseInt(args))
            -- local banco = vRP.execute("UpdateMoneyBank", {bank = BankMoney-parseInt(args),user_id = user_id})
            TriggerClientEvent("bank:notify",source,"sucesso","Você sacou R$:"..args.." para sua carteira!","Sucesso")
            vRP.execute("insertUserExtract",{user_id = user_id, valor = parseInt(args), descricao = 'saida', text = 'SAQUE'})
            return true
        else
            TriggerClientEvent("bank:notify",source,"negado","Valor excede o seu dinheiro do banco","Negado")
        end
    end
end


function ws.ExpressMoney()

    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local BankMoney = parseInt(vRP.getBankMoney(user_id))
        if BankMoney >= 1000 then
            vRP.tryWithdraw(user_id,1000)
            TriggerClientEvent("bank:notify",source,"sucesso","Você sacou R$:1000,00 para sua carteira!","Sucesso")
            vRP.execute("insertUserExtract",{user_id = user_id, valor = 1000, descricao = 'saida', text = 'SAQUE RÁPIDO'})
            return true
        else
            TriggerClientEvent("bank:notify",source,"negado","Valor excede o seu dinheiro do banco","Negado")
        end
    end
end

function ws.DepositMoney(args)

    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local WalletMoney = parseInt(vRP.getMoney(user_id))
        local BankMoney = parseInt(vRP.getBankMoney(user_id))
        if parseInt(args) <= WalletMoney then
            vRP.tryDeposit(user_id, parseInt(args))
            TriggerClientEvent("bank:notify",source,"sucesso","Você depositou R$:"..args.." para seu banco!","Sucesso")
            vRP.execute("insertUserExtract",{user_id = user_id, valor = parseInt(args), descricao = 'entrada', text = 'DEPOSITO'})
            return true
        else
            TriggerClientEvent("bank:notify",source,"negado","Valor excede o seu dinheiro na carteira","Negado")
        end
    end
end 

function ws.Send(id,valor)

    local source = source
    local user_id = vRP.getUserId(source)
    local Player = vRP.query("ConsultBank", {user_id = parseInt(id)})
    local nuser_id = vRP.getUserSource(id)
    if user_id and nuser_id then
        if Player[1] then
            if Player[1].user_id ~= user_id then
                local banco = parseInt(vRP.getBankMoney(user_id))
                local nBanco = parseInt(vRP.getBankMoney(parseInt(id)))

                if parseInt(valor) <= banco then
                    vRP.setBankMoney(user_id,banco-parseInt(valor))
                    vRP.setBankMoney(parseInt(nuser_id),nBanco+parseInt(valor))


                    TriggerClientEvent("bank:notify",source,"sucesso","Você enviou R$:"..parseInt(valor).." para o passaporte "..id.." !","Sucesso")
                    TriggerClientEvent("bank:notify",nuser_id,"sucesso","Você recebeu R$:"..parseInt(valor).." em seu banco!","Sucesso")
                    TriggerClientEvent("bank:recebimentos",nuser_id,"TED",valor)

                    vRP.execute("insertUserExtract",{user_id = user_id, valor = parseInt(valor), descricao = 'saida', text = 'TED'})
                    vRP.execute("insertUserExtract",{user_id = nuser_id, valor = parseInt(valor), descricao = 'entrada', text = 'TED'})

                    return true
                else
                    TriggerClientEvent("bank:notify",source,"negado","Valor excede o seu dinheiro na carteira","Negado")
                end
            else
                TriggerClientEvent("bank:notify",source,"negado","Você não pode enviar dinheiro para sí mesmo!","Negado")
            end
        else
            TriggerClientEvent("bank:notify",source,"negado","passaporte inválido ou inexistente!","Negado")
        end
    else
        TriggerClientEvent("bank:notify",source,"negado","Não encontramos essa pessoa no radar!","Negado")
    end
end

function ws.payMultas(id,valor)

    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local banco = vRP.getBankMoney(user_id)
        if parseInt(valor) <= banco then
            local Pay = vRP.execute("PayTrafficTicket",{id = parseInt(id) })
            vRP.setBankMoney(user_id, banco-parseInt(valor))
            vRP.execute("insertUserExtract",{user_id = user_id, valor = parseInt(valor), descricao = 'saida', text = 'MULTA'})
            TriggerClientEvent("bank:notify",source,"sucesso","Você pagou sua multa com sucesso","Sucesso")
            return true
        else
            TriggerClientEvent("bank:notify",source,"negado","Valor excede o seu dinheiro no banco","Negado")
        end
    end
end

function ws.ConsultPlayer()

    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local banco = vRP.query("ConsultBank", {user_id = user_id})
        local carteira = vRP.getMoney(user_id)
        return carteira,banco[1].bank,banco[1].pix
    end
end 
 
function ws.GetMoneySystem()
    local source = source
    local user_id = vRP.getUserId(source)
    local carteira = vRP.getMoney(user_id)
    local banco = vRP.getBankMoney(user_id)
    local multas = vRP.getUData(user_id,"vRP:multas")
    return carteira,banco,multas
end

function ws.ConsultarMultas()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local multas = vRP.query("SearchTrafficTicket", {user_id = user_id})
        return multas
    end
end

function ws.CheckPolicePermission()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"policia.permissao") then
            return true
        else
            TriggerClientEvent("bank:notify",source,"negado","Você não tem cargo para efetuar essa ação","Negado")
        end
    end
end


function ws.ApplyTicket(id,value,reason,desc)

    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP.execute("GiveTrafficTicket", {user_id = parseInt(id), valor = parseInt(value), motivo = reason, data = os.date("%d/%m/%Y"), descricao = desc})
        TriggerClientEvent("bank:notify",source,"sucesso","Você multou o passaporte "..id.." com sucesso!","Sucesso")
        return true
    end
end
---/// AUTENTICAÇÃO /// ---



local rebornAutenticator = true
local defaultnumber = 8


function ws.requestAuth()
    return true
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- generateRandomNumber
-----------------------------------------------------------------------------------------------------------------------------------------
local function generateRandomNumber(max)
	local zbyte = string.byte("0")
	local number = ""
	for i=1,max do
		number = number..string.char(zbyte+math.random(1,9))
	end
	return number
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- generateNewRandomNumber
-----------------------------------------------------------------------------------------------------------------------------------------
local function generateNewRandomNumber(number)
	local t = {}

	number:gsub(".", function(c)
		table.insert(t, c)
	end)

	local newnumber = number

	for k, v in pairs(t) do
		v2 = tonumber(v)
		if k == 1 or k == 4 or k == 7 then
			if v2 < 4 then
				newnumber = newnumber - defaultnumber
			elseif v2 < 7 then
				newnumber = newnumber * defaultnumber
			else
				newnumber = newnumber + defaultnumber
			end
		elseif k == 2 or k == 5 or k == 8 then
			if v2 < 4 then
				newnumber = newnumber / defaultnumber
			elseif v2 < 7 then
				newnumber = newnumber + defaultnumber
			else
				newnumber = newnumber * defaultnumber
			end
		elseif k == 3 or k == 6 or k == 9 then
			if v2 < 4 then
				newnumber = newnumber - defaultnumber
			elseif v2 < 7 then
				newnumber = newnumber * defaultnumber
			else
				newnumber = newnumber / defaultnumber
			end
		else
			if v2 < 4 then
				newnumber = newnumber + defaultnumber
			elseif v2 < 7 then
				newnumber = newnumber / defaultnumber
			else
				newnumber = newnumber * defaultnumber
			end
		end
	end

	return newnumber
end

local number = generateRandomNumber(10)
local newnumber = generateNewRandomNumber(number)

local cfg = module(GetCurrentResourceName(),"cfg")

local datapost = {
    token       = cfg.license,
    script      = GetCurrentResourceName(),
    number      = number
}


