var produtos = [
    {
        id: 1,
        category: 'branca',
        name: 'Faca',
        qtItem: '1',
        set: 'wbody|WEAPON_KNIFE',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747474226767986688/WEAPON_KNIFE.png',
        price: 8000,
        description: 'COLOQUE A DESCRIÇÃO DO ITEM DESEJADO!'
    },
    {
        id: 2,
        category: 'branca',
        name: 'Adaga',
        qtItem: '1',
        set: 'wbody|WEAPON_DAGGER',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747474232497143938/WEAPON_DAGGER.png',
        price: 8000,
        description: 'COLOQUE A DESCRIÇÃO DO ITEM DESEJADO!'
    },
    {
        id: 3,
        category: 'branca',
        name: 'Soco Ingles',
        qtItem: '1',
        set: 'wbody|WEAPON_KNUCKLE',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747475457355546724/WEAPON_KNUCKLE.png',
        price: 8000,
        description: 'COLOQUE A DESCRIÇÃO DO ITEM DESEJADO!'
    },
    {
        id: 4,
        category: 'branca',
        name: 'Machete',
        qtItem: '1',
        set: 'wbody|WEAPON_MACHETE',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747474230685466704/WEAPON_MACHETE.png',
        price: 8000,
        description: 'COLOQUE A DESCRIÇÃO DO ITEM DESEJADO!'
    },
    {
        id: 5,
        category: 'branca',
        name: 'Canivete',
        qtItem: '1',
        set: 'wbody|WEAPON_SWITCHBLADE',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747474273416904865/WEAPON_SWITCHBLADE.png',
        price: 8000,
        description: 'COLOQUE A DESCRIÇÃO DO ITEM DESEJADO!'
    },
    {
        id: 6,
        category: 'branca',
        name: 'Chave de Grifo',
        qtItem: '1',
        set: 'wbody|WEAPON_WRENCH',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747474227967295538/WEAPON_WRENCH.png',
        price: 8000,
        description: 'COLOQUE A DESCRIÇÃO DO ITEM DESEJADO!'
    },
    {
        id: 7,
        category: 'branca',
        name: 'Pé de Cabra',
        qtItem: '1',
        set: 'wbody|WEAPON_CROWBAR',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747474229636890624/WEAPON_CROWBAR.png',
        price: 8000,
        description: 'TESTANDO DESCRIÇÃO!'
    },
    {
        id: 8,
        category: 'branca',
        name: 'Martelo',
        qtItem: '1',
        set: 'wbody|WEAPON_HAMMER',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747474223408349404/WEAPON_HAMMER.png',
        price: 8000,
        description: 'COLOQUE A DESCRIÇÃO DO ITEM DESEJADO!'
    },
    {
        id: 9,
        category: 'branca',
        name: 'Machado',
        qtItem: '1',
        set: 'wbody|WEAPON_HATCHET',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747474224448274432/WEAPON_HATCHET.png',
        price: 8000,
        description: 'TESTANDO DESCRIÇÃO!'
    },
    // {id:10,   category:'branca',     name:'Machado de Batalha',     qtItem:'1',      set:'wbody|WEAPON_BATTLEAXE',          img:'https://cdn.discordapp.com/attachments/742822226650202143/747474280433975296/WEAPON_BATTLEAXE.png',                price:90,           description:'TESTANDO DESCRIÇÃO!'},
    {
        id: 11,
        category: 'branca',
        name: 'Taco de Golf',
        qtItem: '1',
        set: 'wbody|WEAPON_GOLFCLUB',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747474275610394638/WEAPON_GOLFCLUB.png',
        price: 8000,
        description: 'COLOQUE A DESCRIÇÃO DO ITEM DESEJADO!'
    },
    {
        id: 12,
        category: 'branca',
        name: 'Taco de Basebol',
        qtItem: '1',
        set: 'wbody|WEAPON_BAT',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747475671084826714/WEAPON_BAT.png',
        price: 8000,
        description: 'TESTANDO DESCRIÇÃO!'
    },
    {
        id: 13,
        category: 'branca',
        name: 'Taco de Sinuca',
        qtItem: '1',
        set: 'wbody|WEAPON_POOLCUE',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747475824034447370/WEAPON_POOLCUE.png',
        price: 8000,
        description: 'TESTANDO DESCRIÇÃO!'
    },
    {
        id: 14,
        category: 'branca',
        name: 'Vidro Quebrado',
        qtItem: '1',
        set: 'wbody|WEAPON_BOTTLE',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747474222233944154/WEAPON_BOTTLE.png',
        price: 8000,
        description: 'TESTANDO DESCRIÇÃO!'
    },
    // {id:15,   category:'branca',     name:'Machado de Pedra',       qtItem:'1',      set:'wbody|WEAPON_STONE_HATCHET',      img:'https://cdn.discordapp.com/attachments/742822226650202143/747475459222143046/WEAPON_STONE_HATCHET.png',            price:150,          description:'TESTANDO DESCRIÇÃO!'},
    {
        id: 16,
        category: 'utilitario',
        name: 'Lanterna',
        qtItem: '1',
        set: 'wbody|WEAPON_FLASHLIGHT',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747474234984497303/WEAPON_FLASHLIGHT.png',
        price: 8000,
        description: 'TESTANDO DESCRIÇÃO!'
    },
    {
        id: 17,
        category: 'utilitario',
        name: 'Paraquedas',
        qtItem: '1',
        set: 'wbody|GADGET_PARACHUTE',
        img: 'https://cdn.discordapp.com/attachments/742822226650202143/747474276957028432/paraquedas.png',
        price: 10000,
        description: 'TESTANDO DESCRIÇÃO!'
    },
    {
        id: 18,
        category: 'utilitario',
        name: 'Mochila',
        qtItem: '1',
        set: 'mochila',
        img: 'https://cdn.discordapp.com/attachments/780886760078835712/797195011144941568/72f9c59cf2f33fadae72fcc61f8e691c-iacute-cone-de-mochila-de-acampamento-by-vexels.png',
        price: 30000,
        description: 'TESTANDO DESCRIÇÃO!'
    },
    // {id:19,   category:'utilitario', name:'Colete',             qtItem:'1',      set:'colete',          img:'https://media.discordapp.net/attachments/837448925417963581/848324917563752448/b3e9adec1dd7350ce86c337b3c07b28a-colete-de-prote-ccedil-atilde-o-cinza-by-vexels.png?width=480&height=480',                      price:20000,          description:'TESTANDO DESCRIÇÃO!'},
];