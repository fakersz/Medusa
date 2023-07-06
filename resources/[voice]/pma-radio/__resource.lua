client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

author 'Dom Ressler#3102'
description 'Radio para PMA-VOICE'
version '1.0.0'

ui_page "nui/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua"
}

files {
	"nui/index.html",
	"nui/jquery.js",
	"nui/css.css",
	"nui/dseg7.ttf",
	"nui/images/background.png"
}