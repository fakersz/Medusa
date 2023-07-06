fx_version 'adamant'
game 'gta5'

client_scripts {
    "@vrp/lib/utils.lua",
    'config.lua',
    'client.lua'
}

server_scripts {
    "@vrp/lib/utils.lua",
    'config.lua',
    'server.lua'
}

ui_page "html/index.html"

files {
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/fonts/*.ttf',
    'html/fonts/*.otf',
    'html/fonts/*.woff',
    'html/*.mp3',
}

lua54 'yes'