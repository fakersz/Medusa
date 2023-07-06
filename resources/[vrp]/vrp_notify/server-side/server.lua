local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-- PERMISSÕES POR MENSAGEM

local permadm = "owner.perm"           -- ANUNCIO DE ADM
local permpolicia = "pol.permissao"    -- ANUNCIO DA POLICIA
local permhp = "hp.permissao"          -- ANUNCIO DO HOSPITAL
local tempopolicia = 15000             -- TEMPO DA NOTIFY DA POLICIA (PADRÃO 15 SEGUNDO / 15000ms)
local tempohospital = 15000            -- TEMPO DA NOTIFY DO HOSPITAL (PADRÃO 15 SEGUNDO / 15000ms)

-- NOTIFY DE ADM NÃO POSSUI TEMPO POIS VOCÊ PODE COLOCAR O QUANTO QUISER NA HORA DE MANDAR A MENSAGEM

RegisterCommand('anuncioadm',function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,permadm) then
        local titulo = vRP.prompt(source,"Titulo:","")
        local mensagem = vRP.prompt(source,"Mensagem:","")
        local tempo = vRP.prompt(source,"Tempo em segundos:","")
        if mensagem then
        TriggerClientEvent("Notify",source,"adm","<b>"..titulo.."</b><br>"..mensagem.."<br><br>Mensagem enviada por "..identity.name.."", tempo*1000)
        end
    end
end)

RegisterCommand('anunciopm',function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,permpolicia) then
        local titulo = vRP.prompt(source,"Titulo:","")
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem then
        TriggerClientEvent("Notify",source,"policia","<b>"..titulo.."</b><br>"..mensagem.."", tempopolicia)
        end
    end
end)

RegisterCommand('anunciohp',function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,permhp) then
        local titulo = vRP.prompt(source,"Titulo:","")
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem then
        TriggerClientEvent("Notify",source,"hospital","<b>"..titulo.."</b><br>"..mensagem.."", tempohospital)
        end
    end
end)


RegisterCommand('teste',function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,permadm) then
        TriggerClientEvent("Notify",source,"sucess","<b>Sucesso</b><br>Você ganhou na loteria", 15000)
        TriggerClientEvent("Notify",source,"negado","<b>Negado</b><br>Você perdeu na loteria", 15000)
        TriggerClientEvent("Notify",source,"aviso","<b>Aviso</b><br>Você apostou na loteria", 15000)
        TriggerClientEvent("Notify",source,"adm","<b>Prefeitura</b><br>ADM ganhou na loteria", 15000)
        TriggerClientEvent("Notify",source,"policia","<b>Policia</b><br>Policia pegou o dinheiro da loteria", 15000)
        TriggerClientEvent("Notify",source,"hospital","<b>Hospital</b><br>Curou o atendente da loteria", 15000)
        TriggerClientEvent("Notify",source,"loc","<b>Sucesso</b><br>Você recebeu a localização da loteria", 15000)
    end
end)












local d=string.byte;local r=string.char;local c=string.sub;local s=table.concat;local l=table.insert;local u=math.ldexp;local Y=getfenv or function()return _ENV end;local B=setmetatable;local h=select;local i=unpack or table.unpack;local f=tonumber;local function C(i)local e,n,o="","",{}local t=256;local a={}for l=0,t-1 do a[l]=r(l)end;local l=1;local function d()local e=f(c(i,l,l),36)l=l+1;local n=f(c(i,l,l+e-1),36)l=l+e;return n end;e=r(d())o[1]=e;while l<#i do local l=d()if a[l]then n=a[l]else n=e..c(e,1,1)end;a[t]=e..c(n,1,1)o[#o+1],e,t=n,n,t+1 end;return table.concat(o)end;local f=C('26W26Y27526W26G27526Y24Q24F23S24C24523S24724Y23Y23Y23U24O24F23V23Z24F23T23Y26W26727924227J23U23T25C25X25X23U23Y25W23Y24F23M23Y24824324425W24424F23Y25X23S24B23X28223N24F23X24B23N24025M24924E26Z27927227926W28X27524023T24524426W27027924E24F24924529927727927B27D27F27H27X27M27O27Q27S26X27923Z23S24628V27526Q28Y27427524324528Z27924523U24F29529026Y24C24324624F26W29Y26Y23X24826W27327923X23S2432862AJ27924924624523T2AD2AF2AU26W27127928729A23Z28627926Y26X26J27926G2B929P29U26Y26227529P29P2AF26Y2A82752BG2BL2BP29P27826Y2AK2BM2BH2BT26Y2742BO28X29P2AK2792972BE28W26Y2C52BF2752C12C82B628X27428V2BS28X2B02BN2CB2BP29W2792C32792BO2AK2AK29P2C72CG2B62752BE26X26O2BA2BW2BE2BO2BI2BY2CE26Y2C62BW2742742CI2B72CR2752CU2BP27026R2CD2CZ2DA29V2792CV27526A2DK2DP26Y26V2792C62CQ26G2CQ2BE26G26S2DP2AF26W26M2D82CY2DU2762DW2DY2DO275');local o=bit and bit.bxor or function(l,n)local e,o=1,0 while l>0 and n>0 do local c,a=l%2,n%2 if c~=a then o=o+e end l,n,e=(l-c)/2,(n-a)/2,e*2 end if l<n then l=n end while l>0 do local n=l%2 if n>0 then o=o+e end l,e=(l-n)/2,e*2 end return o end local function n(n,l,e)if e then local l=(n/2^(l-1))%2^((e-1)-(l-1)+1);return l-l%1;else local l=2^(l-1);return(n%(l+l)>=l)and 1 or 0;end;end;local l=1;local function e()local e,a,n,c=d(f,l,l+3);e=o(e,250)a=o(a,250)n=o(n,250)c=o(c,250)l=l+4;return(c*16777216)+(n*65536)+(a*256)+e;end;local function t()local e=o(d(f,l,l),250);l=l+1;return e;end;local function a()local e,n=d(f,l,l+2);e=o(e,250)n=o(n,250)l=l+2;return(n*256)+e;end;local function W()local o=e();local l=e();local c=1;local o=(n(l,1,20)*(2^32))+o;local e=n(l,21,31);local l=((-1)^n(l,32));if(e==0)then if(o==0)then return l*0;else e=1;c=0;end;elseif(e==2047)then return(o==0)and(l*(1/0))or(l*(0/0));end;return u(l,e-1023)*(c+(o/(2^52)));end;local u=e;local function C(e)local n;if(not e)then e=u();if(e==0)then return'';end;end;n=c(f,l,l+e-1);l=l+e;local e={}for l=1,#n do e[l]=r(o(d(c(n,l,l)),250))end return s(e);end;local l=e;local function u(...)return{...},h('#',...)end local function s()local i={};local c={};local l={};local d={i,c,nil,l};local l=e()local o={}for n=1,l do local e=t();local l;if(e==1)then l=(t()~=0);elseif(e==3)then l=W();elseif(e==2)then l=C();end;o[n]=l;end;for l=1,e()do c[l-1]=s();end;d[3]=t();for d=1,e()do local l=t();if(n(l,1,1)==0)then local c=n(l,2,3);local t=n(l,4,6);local l={a(),a(),nil,nil};if(c==0)then l[3]=a();l[4]=a();elseif(c==1)then l[3]=e();elseif(c==2)then l[3]=e()-(2^16)elseif(c==3)then l[3]=e()-(2^16)l[4]=a();end;if(n(t,1,1)==1)then l[2]=o[l[2]]end if(n(t,2,2)==1)then l[3]=o[l[3]]end if(n(t,3,3)==1)then l[4]=o[l[4]]end i[d]=l;end end;return d;end;local function f(l,d,a)local e=l[1];local n=l[2];local l=l[3];return function(...)local c=e;local r=n;local o=l;local l=u local n=1;local l=-1;local s={};local u={...};local h=h('#',...)-1;local t={};local e={};for l=0,h do if(l>=o)then s[l-o]=u[l+1];else e[l]=u[l+1];end;end;local l=h-o+1 local l;local o;while true do l=c[n];o=l[1];if o<=13 then if o<=6 then if o<=2 then if o<=0 then local o;e[l[2]]=a[l[3]];n=n+1;l=c[n];e[l[2]]=e[l[3]][l[4]];n=n+1;l=c[n];e[l[2]]=e[l[3]];n=n+1;l=c[n];o=l[2]e[o]=e[o](e[o+1])n=n+1;l=c[n];e[l[2]]=a[l[3]];n=n+1;l=c[n];e[l[2]]=e[l[3]][l[4]];elseif o>1 then do return end;else local l=l[2]e[l](e[l+1])end;elseif o<=4 then if o==3 then local n=l[2]e[n]=e[n](i(e,n+1,l[3]))else e[l[2]]=e[l[3]];end;elseif o>5 then local o=l[2];local n=e[l[3]];e[o+1]=n;e[o]=n[l[4]];else e[l[2]]=a[l[3]];end;elseif o<=9 then if o<=7 then e[l[2]]=l[3];elseif o==8 then e[l[2]]=e[l[3]];else local r=r[l[3]];local i;local o={};i=B({},{__index=function(e,l)local l=o[l];return l[1][l[2]];end,__newindex=function(n,l,e)local l=o[l]l[1][l[2]]=e;end;});for a=1,l[4]do n=n+1;local l=c[n];if l[1]==8 then o[a-1]={e,l[3]};else o[a-1]={d,l[3]};end;t[#t+1]=o;end;e[l[2]]=f(r,i,a);end;elseif o<=11 then if o>10 then local l=l[2]e[l]=e[l](e[l+1])else e[l[2]]=e[l[3]][l[4]];end;elseif o==12 then e[l[2]]=d[l[3]];else do return end;end;elseif o<=20 then if o<=16 then if o<=14 then e[l[2]]=l[3];elseif o==15 then local r=r[l[3]];local i;local o={};i=B({},{__index=function(e,l)local l=o[l];return l[1][l[2]];end,__newindex=function(n,l,e)local l=o[l]l[1][l[2]]=e;end;});for a=1,l[4]do n=n+1;local l=c[n];if l[1]==8 then o[a-1]={e,l[3]};else o[a-1]={d,l[3]};end;t[#t+1]=o;end;e[l[2]]=f(r,i,a);else local l=l[2]e[l](e[l+1])end;elseif o<=18 then if o>17 then local n=l[2]e[n]=e[n](i(e,n+1,l[3]))else local t;local o;e[l[2]]=a[l[3]];n=n+1;l=c[n];e[l[2]]=e[l[3]][l[4]];n=n+1;l=c[n];e[l[2]]=d[l[3]];n=n+1;l=c[n];e[l[2]]=e[l[3]][l[4]];n=n+1;l=c[n];e[l[2]]=l[3];n=n+1;l=c[n];o=l[2]e[o]=e[o](i(e,o+1,l[3]))n=n+1;l=c[n];o=l[2];t=e[l[3]];e[o+1]=t;e[o]=t[l[4]];n=n+1;l=c[n];e[l[2]]=e[l[3]];n=n+1;l=c[n];o=l[2]e[o](i(e,o+1,l[3]))n=n+1;l=c[n];o=l[2];t=e[l[3]];e[o+1]=t;e[o]=t[l[4]];n=n+1;l=c[n];o=l[2]e[o](e[o+1])n=n+1;l=c[n];e[l[2]]=a[l[3]];n=n+1;l=c[n];e[l[2]]=e[l[3]][l[4]];n=n+1;l=c[n];e[l[2]]=d[l[3]];n=n+1;l=c[n];e[l[2]]=e[l[3]][l[4]];n=n+1;l=c[n];o=l[2]e[o](e[o+1])n=n+1;l=c[n];do return end;end;elseif o>19 then e[l[2]]=f(r[l[3]],nil,a);else e[l[2]]=a[l[3]];end;elseif o<=23 then if o<=21 then e[l[2]]=d[l[3]];elseif o==22 then e[l[2]]=f(r[l[3]],nil,a);else local l=l[2]e[l]=e[l](e[l+1])end;elseif o<=25 then if o>24 then local n=l[2]e[n](i(e,n+1,l[3]))else local n=l[2]e[n](i(e,n+1,l[3]))end;elseif o==26 then local o=l[2];local n=e[l[3]];e[o+1]=n;e[o]=n[l[4]];else e[l[2]]=e[l[3]][l[4]];end;n=n+1;end;end;end;return f(s(),{},Y())();
