var cart = [];
var modalKey = 0;
var modalQt = 0;
var key = 0;

$(document).ready(()=>{
    var actionContainer = $("#container");
    window.addEventListener('message',function(event){
        var item = event.data;
        if (item.showmenu){
           cart = [];
           $('#circle').html(0);

           $('#total').html('R$0,00');

           $('#listaCart').html('');
       
           actionContainer.show();
        }
        if (item.hidemenu){
            actionContainer.hide();
        }


    });

    $('#lista').html("")
    produtos.map((item, i)=>{
        modalKey = item.id;
        $('#'+item.category).append(`
            <div class="produtos" id="id${item.id}" onclick="selecionar(this)" data-name="${item.name}" data-key="${item.id}" data-price="${item.price}" data-set="${item.set}" data-qt="${item.qtItem}" data-img="${item.img}" style="background-image: url(${item.img});">
                <div id="atoa">
                    <div class="nomeProduto">${item.name}</div>
                    <div class="quantidadeProduto">1x</div>
                    <div class="valorProduto">R$ ${(item.price).toFixed(2)}</div>
                </div>
            </div>
        `);

        $('#'+item.category+'Menu').click(()=>{
            $('.listaProdutos').hide()
            $('.selecionado').removeClass('selecionado')
            $('#'+item.category).slideDown(300);
            $('#'+item.category+'Menu').addClass('selecionado');
        })
    })



    $('#pesquisa').click(()=>{
        $('#fundoCompra').show();
        $('#modalCompra').addClass('animate__fadeInRight');
        $('#modalCompra').show();
        
    })
    $('#fundoCompra').click(()=>{
        $('#modalCompra').removeClass('animate__fadeInRight').addClass('animate__fadeOutRight');

        setTimeout(() => {
            $('#fundoCompra').fadeOut(150);
            $('#modalCompra').removeClass('animate__fadeOutRight');
            $('#modalCompra').hide();

            
        }, 500);
    })

});



function selecionar(el){
    
    let key = cart.findIndex((item)=>item.id == $(el).data('key'));
    if(key > -1){
        cart[key].qt = cart[key].qt + $(el).data('qt'); 
    }else{
        cart.push({
            id: $(el).data('key'),
            price: $(el).data('price'),
            set: $(el).data('set'),
            img: $(el).data('img'),
            qt: $(el).data('qt'),
            name: $(el).data('name'),
        });
    }
    $('#circle').html(cart.length);


    $('#listaCart').html('');
    cart.map((item, i)=>{
        $('#listaCart').append(`
            <div class="produtoCart">
                <img src="${item.img}" alt="">
                <div class="nomeCart">${item.name}</div>
                <div class="addCart">
                        <div class="menosCart" data-name="${item.name}" data-key="${item.id}" data-price="${item.price}" data-set="${item.set}" data-qt="${item.qt}" data-img="${item.img}"  onclick="diminuir(this)">-</div>
                        <div class="quantCart">${item.qt}x</div>
                        <div class="maisCart" data-name="${item.name}" data-key="${item.id}" data-price="${item.price}" data-set="${item.set}" data-qt="${item.qt}" data-img="${item.img}"  onclick="aumentar(this)">+</div>
                </div>
            </div>
        `);
    })

    
    atualizarValor();
}

function diminuir(el){
    
    let key = cart.findIndex((item)=>item.id == $(el).data('key'));

    if(cart[key].qt - 1 <= 0){
        cart.splice(key,1)
        $('#listaCart').html('');
        cart.map((item, i)=>{
            $('#listaCart').append(`
                <div class="produtoCart">
                    <img src="${item.img}" alt="">
                    <div class="nomeCart">${item.name}</div>
                    <div class="addCart">
                            <div class="menosCart" data-name="${item.name}" data-key="${item.id}" data-price="${item.price}" data-set="${item.set}" data-qt="${item.qt}" data-img="${item.img}"  onclick="diminuir(this)">-</div>
                            <div class="quantCart">${item.qt}x</div>
                            <div class="maisCart" data-name="${item.name}" data-key="${item.id}" data-price="${item.price}" data-set="${item.set}" data-qt="${item.qt}" data-img="${item.img}"  onclick="aumentar(this)">+</div>
                    </div>
                </div>
            `);
        })  
    
    }else {
    if(key > -1){
        cart[key].qt = cart[key].qt - 1; 
    }
    $('#listaCart').html('');
    cart.map((item, i)=>{
        $('#listaCart').append(`
            <div class="produtoCart">
                <img src="${item.img}" alt="">
                <div class="nomeCart">${item.name}</div>
                <div class="addCart">
                        <div class="menosCart" data-name="${item.name}" data-key="${item.id}" data-price="${item.price}" data-set="${item.set}" data-qt="${item.qt}" data-img="${item.img}"  onclick="diminuir(this)">-</div>
                        <div class="quantCart">${item.qt}x</div>
                        <div class="maisCart" data-name="${item.name}" data-key="${item.id}" data-price="${item.price}" data-set="${item.set}" data-qt="${item.qt}" data-img="${item.img}"  onclick="aumentar(this)">+</div>
                </div>
            </div>
        `);
    })  
}
    atualizarValor();
}


function aumentar(el){
    
    let key = cart.findIndex((item)=>item.id == $(el).data('key'));
    if(key > -1){
        cart[key].qt = cart[key].qt + 1; 
    }
    $('#listaCart').html('');
    cart.map((item, i)=>{
        $('#listaCart').append(`
            <div class="produtoCart">
                <img src="${item.img}" alt="">
                <div class="nomeCart">${item.name}</div>
                <div class="addCart">
                        <div class="menosCart" data-name="${item.name}" data-key="${item.id}" data-price="${item.price}" data-set="${item.set}" data-qt="${item.qt}" data-img="${item.img}"  onclick="diminuir(this)">-</div>
                        <div class="quantCart">${item.qt}x</div>
                        <div class="maisCart" data-name="${item.name}" data-key="${item.id}" data-price="${item.price}" data-set="${item.set}" data-qt="${item.qt}" data-img="${item.img}"  onclick="aumentar(this)">+</div>
                </div>
            </div>
        `);
    })
    atualizarValor();
}


function atualizarValor(){
    var valor = 0;
    cart.map((item, i)=>{
        valor = Number(valor) + Number(item.qt*item.price);
    })
    $('#circle').html(cart.length);

    $('#total').html('R$'+(valor).toFixed(2));
}

$('#comprar').click(()=>{
    console.log(cart.length)
    $.post("http://uf-ammunation/finalizando", JSON.stringify({
        cart:cart,
    }));
})

 function sendData(name,data){
 	$.post("http://uf-ammunation/"+name,JSON.stringify(data),function(datab){
 		if (datab != "ok"){
 			console.log(datab);
 		}
 	});
 }

 
 document.onkeyup = function(data){
    if (data.which == 27){       
        if ($('#container').is(":visible")){
            sendData("ButtonClick","fechar")
        }
    }
};