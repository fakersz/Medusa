vRP = module("vrp", "lib/Proxy").getInterface("vRP")
vRPclient = module("vrp", "lib/Tunnel").getInterface("vRP")
dPN = {}
module("vrp", "lib/Tunnel").bindInterface("dpn_criacao", dPN)
module("vrp", "lib/Proxy").addInterface("dpn_criacao", dPN)
dPNclient = module("vrp", "lib/Tunnel").getInterface("dpn_criacao")
local va = {}

function SendWebhookMessage(a, b)
  a = a
  if a ~= nil and a ~= "" then
    PerformHttpRequest(a, function(a, b, c)
      a = a
    end, "POST", json.encode({content = b}), {
      ["Content-Type"] = "application/json"
    })
  end
end



AddEventHandler("vRP:playerSpawn", function(a, b, c)
  a = a
  if c then
    if json.decode((vRP.getUData(a, "vRP:spawnController"))) or 0 then
      Citizen.Wait(1000)
      va[c] = true
      criarNovoPersonagem(b, json.decode((vRP.getUData(a, "vRP:spawnController"))) or 0, a)
    end
  end
end)
function criarNovoPersonagem(a, b, c)
  a = a
  if b == 2 then
    if not va[c] then
      va[c] = true
      spawnarPessoa(a, c, false)
    else
      spawnarPessoa(a, c, true)
    end
  else
    if b ~= 1 then
    end
    if b == 0 then
      va[c] = true
      if vb == true then
        dPNclient.createNewPerson(a)
      end
    end
  end
end
function spawnarPessoa(a, b, c)
  a = a
  dPNclient.cameraStartar(a, c)
  barberShopPlayer(b, c)
end
function dPN.updateFirstInformation(a, b, c)
  a = a
  if vRP.getUserId(source) then
    vRP.execute("vRP/update_user_first_spawn", {
      user_id = vRP.getUserId(source),
      firstname = b,
      name = a,
      age = c
    })
  end
end
function dPN.finalizarPersonagem(a)
  local source = source
  local user_id = vRP.getUserId(source)
  a = a
  if a then
    vRP.setUData(user_id, "currentCharacterMode", json.encode(a))
    vRP.setUData(user_id, "vRP:spawnController", json.encode(2))
    barberShopPlayer(user_id, true)
    vRP.updateCustomization((vRPclient.getCustomization(source)))
  end
end
function dPN.resetPerson(a)
  a = a
  if a and vRP.getUserSource(a) and vRP.request(vRP.getUserSource(a), "Um admin deseja resetar seu personagem, voc\234 deseja proseguir?", 1000) then
    vRP.setUData(a, "currentCharacterMode", "")
    vRP.setUData(a, "vRP:spawnController", json.encode(1))
    dPNclient.createNewPerson((vRP.getUserSource(a)))
  end
end

function dPN.checkPermission()
  if vRP.hasPermission(vRP.getUserId(source), Config_server.permission) then
    return true
  else
    return false
  end
end
function dPN.giveItem()
  if vRP.getUserId(source) then
    giveItensCharacterFinish(source, (vRP.getUserId(source)))
  end
end
for fs = 1, 62 do
end
function TakeBestBucket()
  for fe = 1, TableLen(va) do
    ValueLen = TableLen(va[tostring(fe)])
    if ValueLen == 0 then
      return (tostring(fe))
    end
  end
  return {
    section = nil,
    quantity = nil,
    section = tostring(fe),
    quantity = ValueLen,
    quantity = ValueLen,
    section = tostring(fe)
  }
end
function InsertIdIntoBuckets(a, b)
  a = a
  va[tostring(b)][a] = true
end
function RemoveIdFromAnyBuckets(a)
  a = a
  va[tostring((GetBucketIdIsIn(a)))][a] = nil
  SetPlayerRoutingBucket(a, 0)
end
function GetBucketIdIsIn(a)
  a = a
  for fe, fg in pairs(va) do
    if fg[a] then
      return fe
    end
  end
end
function TableLen(a)
  a = a
  for fg, fh in pairs(a) do
  end
  return 0 + 1
end
function SetIdIntoTheBestBucket(a)
  a = a
  InsertIdIntoBuckets(a, (TakeBestBucket()))
  SetPlayerRoutingBucket(a, tonumber((TakeBestBucket())))
end
function RemoveIdFromHisBucket(a)
  a = a
  if a then
  end
  RemoveIdFromAnyBuckets(a)
end
function SetBucket(a)
  a = a
  if a then
  end
  SetIdIntoTheBestBucket(a)
end
RegisterServerEvent("dope:session:on")
AddEventHandler("dope:session:on", function()

  local _source = source 
  SetPlayerRoutingBucket(_source, _source)
end)

RegisterServerEvent("dope:session:off")
AddEventHandler("dope:session:off", function()
  local _source = source 
  SetPlayerRoutingBucket(_source, 0)
end)


