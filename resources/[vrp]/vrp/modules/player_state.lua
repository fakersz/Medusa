local cfg = module("cfg/player_state")

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	local source = source
	local user_id = vRP.getUserId(source)
	local data = vRP.getUserDataTable(user_id)
	vRPclient._setFriendlyFire(source,true)

	if first_spawn then
		if data.colete then
			vRPclient.setArmour(source,data.colete)
		end

		if data.customization == nil then
			data.customization = cfg.default_customization
		end

		if data.position then
			vRPclient.teleport(source,data.position.x,data.position.y,data.position.z)
		end

		if data.customization then
			vRPclient.setCustomization(source,data.customization) 
			if data.weapons then
				vRPclient.giveWeapons(source,data.weapons,true)

				if data.health then
					vRPclient.setHealth(source,data.health)
					TriggerClientEvent("statusStress",source,data.stress)
					SetTimeout(5000,function()
						if vRPclient.isInComa(source) then
							vRPclient.killComa(source)
						end
					end)
				end
			end
		else
			if data.weapons then
				vRPclient.giveWeapons(source,data.weapons,true)
			end

			if data.health then
				vRPclient.setHealth(source,data.health)
				TriggerClientEvent("statusStress",source,data.stress)
			end
		end
	else
		vRPclient._setHandcuffed(source,false)

		if not vRP.hasPermission(user_id,"mochila.permissao") then
			data.gaptitudes = {}
		end

		if data.customization then
			vRPclient._setCustomization(source,data.customization)
		end
	end
		vRPclient._playerStateReady(source,true)
end)

function tvRP.updatePos(x,y,z)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		local tmp = vRP.getUserTmpTable(user_id)
		if data and (not tmp or not tmp.home_stype) then
			data.position = { x = tonumber(x), y = tonumber(y), z = tonumber(z) }
		end
	end
end

function tvRP.updateArmor(armor)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			data.colete = armor
		end
	end
end

function tvRP.updateWeapons(weapons)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			data.weapons = weapons
		end
	end
end

function tvRP.updateCustomization(customization)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			data.customization = customization
		end
	end
end

function tvRP.updateHealth(health)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			data.health = health
		end
	end
end




-----------------------------------------------------------------------------------------------------------------------------------------
-- PREPARE vRP_WEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("vRP/add_weapon","INSERT INTO vrp_weapons(user_id,weapon,ammo) VALUES(@user_id,@weapon,@ammo)")
vRP.prepare("vRP/get_weapon","SELECT * FROM vrp_weapons WHERE user_id = @user_id")
vRP.prepare("vRP/update_weapon","UPDATE vrp_weapons SET ammo = @ammo WHERE user_id = @user_id and weapon = @weapon")
vRP.prepare("vRP/del_weapon","DELETE FROM vrp_weapons WHERE user_id = @user_id AND weapon = @weapon")
-----------------------------------------------------------------------------------------------------------------------------------------
-- GET WEAPONS ID
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getWeaponsId(user_id)
    local infos = vRP.query("vRP/get_weapon",{ user_id = user_id })
	return infos
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD WEAPONS ID
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.addWeaponId(user_id,weapon,ammo)
    local data = vRP.getWeaponsId(user_id)
    local n = false
    if #data > 0 then        
	    for k, v in pairs(data) do            
	    	if v.weapon == weapon then
                local newammo = v.ammo + ammo                
                vRP.execute("vRP/update_weapon",{ user_id = user_id, weapon = weapon, ammo = newammo })                    
                n = true
                break
            end
        end
    end

    if not n then
        vRP.execute("vRP/add_weapon",{ user_id = user_id, weapon = weapon, ammo = ammo })
    end

    -- if data and data[weapon] then
    --     local newammo = data[weapon].ammo + ammo                
    --     vRP.execute("vRP/update_weapon",{ user_id = user_id, weapon = weapon, ammo = newammo })
    -- else
    --     vRP.execute("vRP/add_weapon",{ user_id = user_id, weapon = weapon, ammo = ammo })        
    -- end

	return true
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- MALA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trymala")
AddEventHandler("trymala",function(nveh)
	TriggerClientEvent("syncmala",-1,nveh)
end)