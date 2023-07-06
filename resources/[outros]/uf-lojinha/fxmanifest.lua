fx_version "bodacious"
game "gta5"

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
	"nui/config.js",
	"nui/script.js",
	"nui/index.html",
	"nui/images/*.png",
	"nui/style.css"
}              