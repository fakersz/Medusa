
let MultasTotal = null
let inMultas = false

var saida = null
var ganho = null
var multa = null

$(document).ready(function(){
    window.addEventListener("message", function(event){

        switch(event.data.action){
            case 'opensystem':
                
                $.post("https://ws-bank/getGraphic")

                $('bank_section').css('display','block')
                $('bankClose').css('display','none')
                $( "#secundario" ).removeClass( "active option" ).addClass( "option" );
                $( "#ativo" ).removeClass( "option" ).addClass( "active option" );
                
                $('.left-section').fadeIn(0)
                $('#maskbank').fadeIn(0)
                $('#maskmultas').fadeOut(0)

                ConsultarMultas()
                if(event.data.pix == null){
                    $('#pix-key').html('SEM CHAVE')
                }else{
                    $('#pix-key').html(event.data.pix)
                }

                
                $carteiradiv = `<span id="limit"><small>$</small> ${event.data.carteira} / <span style="color:white;" id="limit-max"><small>$</small>${event.data.banco}</span></span>`
                $('.saldodiv').html($carteiradiv)
            break
                case 'closedbank':
                    $('bankClose').css('display','block')
                break
            case 'closesystem':
                $('bank_section').css('display','none')
                $('bankClose').css('display','none')
            break

            case 'recebimentos':

                $('.content-rendimentos').prepend(`<div class="item">
                    <div class="icon flex">+</div>
                    <span>R$ ${event.data.valor}</span>
                    <small>Seu ${event.data.text}<br> Já está disponivel no seu saldo!</small>
                </div>`)
            break

            case 'showpix':
                $sendpix = `<modal style="display:block;" id="modalDeposito" class="modalOpen">
                    <div class="title">PIX</div>
                    <div class="modal-input">
                        <label>CHAVE PIX:</label>
                        <input id="textPix" maxlength="10" placeholder="EX: JotaP">
                        <label>VALOR DA TRANSFERENCIA</label>
                        <input type="number" id="valueDeposit" placeholder="EX: 500,000">
                    </div>
                    <button id="confirm" onclick="DepositPix()"><svg class="svg-inline--fa fa-check fa-w-16 icon" aria-hidden="true" focusable="false" data-prefix="far" data-icon="check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M435.848 83.466L172.804 346.51l-96.652-96.652c-4.686-4.686-12.284-4.686-16.971 0l-28.284 28.284c-4.686 4.686-4.686 12.284 0 16.971l133.421 133.421c4.686 4.686 12.284 4.686 16.971 0l299.813-299.813c4.686-4.686 4.686-12.284 0-16.971l-28.284-28.284c-4.686-4.686-12.284-4.686-16.97 0z"></path></svg><!-- <i class="far fa-check icon"></i> Font Awesome fontawesome.com --> Confirmar</button>
                    <button id="cancelar" onclick="closeModalPix()"><svg class="svg-inline--fa fa-times fa-w-11 icon" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" data-fa-i2svg=""><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg><!-- <i class="fas fa-times icon"></i> Font Awesome fontawesome.com --> Cancelar</button>
                    <div class="modal-warning">
                        Preencha os campos corretamente antes de confirmar a ação!
                    </div>
                </modal>`
            $('.classedchavepix').html($sendpix)
            break

            case 'showpolice':
                $police = `<modal style="display:block;" id="modalDeposito" class="modalOpen">
                    <div class="title">PAINEL DE MULTA</div>
                    <div class="modal-input">
                        <label>PASSAPORTE:</label>
                        <input type="number" id="passaporte" maxlength="10" placeholder="EX: 254">
                        <label>VALOR DA MULTA:</label>
                        <input type="number" id="valormulta" maxlength="6" placeholder="EX: 10000">
                        <label>MOTIVO DA MULTA</label>
                        <input id="reason" placeholder="FAZENDO DRIFT NA PRAÇA">
                        <label>DESCRIÇÃO DA MULTA</label>
                        <input id="desc" placeholder="HOUVE VARIOS PEDIDOS PARA PARAR E O MESMO NÃO PAROU">
                    </div>
                    <button id="confirm" onclick="SendMulta()"><svg class="svg-inline--fa fa-heck fa-w-16 icon" aria-hidden="true" focusable="false" data-prefix="far" data-icon="check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M435.848 83.466L172.804 346.51l-96.652-96.652c-4.686-4.686-12.284-4.686-16.971 0l-28.284 28.284c-4.686 4.686-4.686 12.284 0 16.971l133.421 133.421c4.686 4.686 12.284 4.686 16.971 0l299.813-299.813c4.686-4.686 4.686-12.284 0-16.971l-28.284-28.284c-4.686-4.686-12.284-4.686-16.97 0z"></path></svg><!-- <i class="far fa-check icon"></i> Font Awesome fontawesome.com --> Confirmar</button>
                    <button id="cancelar" onclick="closeModalPix()"><svg class="svg-inline--fa fa-times fa-w-11 icon" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" data-fa-i2svg=""><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg><!-- <i class="fas fa-times icon"></i> Font Awesome fontawesome.com --> Cancelar</button>
                    <div class="modal-warning">
                        Preencha os campos corretamente antes de confirmar a ação!
                    </div>
                </modal>`
            $('.classedchavepix').html($police)
            break

            case 'updatepix':
                if(event.data.retorno == null){
                    $('#pix-key').html('SEM CHAVE')
                }else{
                    $('#pix-key').html(event.data.retorno)
                }
            break

            case 'Graphic':

                saida = 0
                ganho = 0
                multa = 0

                $('.chartjs-render-monitor').empty()
                var dados = event.data.dados
                if(dados != "undefined" && dados != null){
                    $('.list-extract').empty()
                    dados.forEach((key,value) => {

                        if(key.Desc == 'saida'){
                            saida = parseInt(saida) + parseInt(key.Valor)
                            $('.list-extract').append(`<div class="extract-item" style="display: flex;">
                            <div class="extract-icon flex">
                                <div class="icon flex"><svg class="svg-inline--fa fa-search-dollar fa-w-16" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="search-dollar" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M505.04 442.66l-99.71-99.69c-4.5-4.5-10.6-7-17-7h-16.3c27.6-35.3 44-79.69 44-127.99C416.03 93.09 322.92 0 208.02 0S0 93.09 0 207.98s93.11 207.98 208.02 207.98c48.3 0 92.71-16.4 128.01-44v16.3c0 6.4 2.5 12.5 7 17l99.71 99.69c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.59.1-33.99zm-297.02-90.7c-79.54 0-144-64.34-144-143.98 0-79.53 64.35-143.98 144-143.98 79.54 0 144 64.34 144 143.98 0 79.53-64.35 143.98-144 143.98zm27.11-152.54l-45.01-13.5c-5.16-1.55-8.77-6.78-8.77-12.73 0-7.27 5.3-13.19 11.8-13.19h28.11c4.56 0 8.96 1.29 12.82 3.72 3.24 2.03 7.36 1.91 10.13-.73l11.75-11.21c3.53-3.37 3.33-9.21-.57-12.14-9.1-6.83-20.08-10.77-31.37-11.35V112c0-4.42-3.58-8-8-8h-16c-4.42 0-8 3.58-8 8v16.12c-23.63.63-42.68 20.55-42.68 45.07 0 19.97 12.99 37.81 31.58 43.39l45.01 13.5c5.16 1.55 8.77 6.78 8.77 12.73 0 7.27-5.3 13.19-11.8 13.19h-28.1c-4.56 0-8.96-1.29-12.82-3.72-3.24-2.03-7.36-1.91-10.13.73l-11.75 11.21c-3.53 3.37-3.33 9.21.57 12.14 9.1 6.83 20.08 10.77 31.37 11.35V304c0 4.42 3.58 8 8 8h16c4.42 0 8-3.58 8-8v-16.12c23.63-.63 42.68-20.54 42.68-45.07 0-19.97-12.99-37.81-31.59-43.39z"></path></svg><!-- <i class="fas fa-search-dollar"></i> Font Awesome fontawesome.com --></div>
                                    <div class="text-icon">
                                        <a>${key.Text}</a>
                                        <small></small>
                                    </div>
                                </div>
                            <span> -R$ ${key.Valor},00</span>
                        </div>`)
                            

                        }else if(key.Desc == 'entrada'){
                            ganho = parseInt(ganho) + parseInt(key.Valor)
                            $('.list-extract').append(`<div class="extract-item" style="display: flex;">
                            <div class="extract-icon flex">
                                <div class="icon flex"><svg class="svg-inline--fa fa-search-dollar fa-w-16" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="search-dollar" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M505.04 442.66l-99.71-99.69c-4.5-4.5-10.6-7-17-7h-16.3c27.6-35.3 44-79.69 44-127.99C416.03 93.09 322.92 0 208.02 0S0 93.09 0 207.98s93.11 207.98 208.02 207.98c48.3 0 92.71-16.4 128.01-44v16.3c0 6.4 2.5 12.5 7 17l99.71 99.69c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.59.1-33.99zm-297.02-90.7c-79.54 0-144-64.34-144-143.98 0-79.53 64.35-143.98 144-143.98 79.54 0 144 64.34 144 143.98 0 79.53-64.35 143.98-144 143.98zm27.11-152.54l-45.01-13.5c-5.16-1.55-8.77-6.78-8.77-12.73 0-7.27 5.3-13.19 11.8-13.19h28.11c4.56 0 8.96 1.29 12.82 3.72 3.24 2.03 7.36 1.91 10.13-.73l11.75-11.21c3.53-3.37 3.33-9.21-.57-12.14-9.1-6.83-20.08-10.77-31.37-11.35V112c0-4.42-3.58-8-8-8h-16c-4.42 0-8 3.58-8 8v16.12c-23.63.63-42.68 20.55-42.68 45.07 0 19.97 12.99 37.81 31.58 43.39l45.01 13.5c5.16 1.55 8.77 6.78 8.77 12.73 0 7.27-5.3 13.19-11.8 13.19h-28.1c-4.56 0-8.96-1.29-12.82-3.72-3.24-2.03-7.36-1.91-10.13.73l-11.75 11.21c-3.53 3.37-3.33 9.21.57 12.14 9.1 6.83 20.08 10.77 31.37 11.35V304c0 4.42 3.58 8 8 8h16c4.42 0 8-3.58 8-8v-16.12c23.63-.63 42.68-20.54 42.68-45.07 0-19.97-12.99-37.81-31.59-43.39z"></path></svg><!-- <i class="fas fa-search-dollar"></i> Font Awesome fontawesome.com --></div>
                                    <div class="text-icon">
                                        <a>${key.Text}</a>
                                        <small></small>
                                    </div>
                                </div>
                            <span> +R$ ${key.Valor},00</span>
                        </div>`)
                        
                            
                        }else if(key.Desc == 'multas'){
                            multa = parseInt(multa) + parseInt(key.Valor)
                        }
                    });
                }else{
                    saida = 0
                    ganho = 0
                    multa = 0
                }
                // var mult = event.data.multas
                // mult.forEach((key,value) => {
                //     multa = multa + key.valor
                // });
                // console.log(saida,ganho,multa)
                var chartGraphic = new Chart($('.chartjs-render-monitor'),{
                    type: 'doughnut',
                    data: {
                        datasets: [{
                            label: 'Gráfico do Banco',
                            data: [saida,ganho,multa],
                            backgroundColor: [
                            'rgb(255, 99, 132)',
                            'rgb(54, 162, 235)',
                            'rgb(255, 205, 86)',
                            ],
                            hoverOffset: 4
                        }],
            
                        labels: [
                            "Saidas",
                            "Ganhos",
                            "Multas",
                        ]
                    }
            
                })


            break
            
            case 'updateaccount':
                $carteiradiv = `<span id="limit"><small>$</small> ${event.data.wallet} / <span style="color:white;" id="limit-max"><small>$</small>${event.data.bank}</span></span>`
                $('.saldodiv').html($carteiradiv)
                break

                case 'notify':

                   $('.notify').append(`
                        <notify style="display: flex;">
                        <div class="svg">
                            <svg class="checkmark ${event.data.type}" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52"><circle class="checkmark_circle_${event.data.type}" cx="26" cy="26" r="25" fill="none"></circle><path class="checkmark_check" stroke-linecap="round" fill="none" d="${event.data.icon}"></path></svg>
                        </div>
                        <div class="line"></div>
                        <div class="text">
                            <span>${event.data.titulo}</span><br>
                            <small>${event.data.texto}</small>
                        </div>
                        </notify>
                    `)
                setTimeout(function(){$('.notify').html('')},5000)

                break
        
            }
        document.onkeyup = function(data){
            if(data.which == 27) {
                $.post("https://ws-bank/fecharbanco")
                closeModal()
                inMultas = false
                $('.content-traffic').empty()
            }
        }
    })
})


function SendMulta(){

    let passaporte = document.querySelector('#passaporte').value
    let valormulta = document.querySelector('#valormulta').value
    let reason = document.querySelector('#reason').value
    let desc = document.querySelector('#desc').value

    if(valormulta > 0 ) {
        if(passaporte == '' | passaporte == " " | valormulta == '' | valormulta == " " | reason == '' | reason == " " | desc == '' | desc == " "){
            return
        }
        closeModalPix()
        $.post("https://ws-bank/multas",JSON.stringify({
            type: 'apply',
            id: passaporte,
            value: valormulta,
            reason: reason,
            desc: desc
        }));
    }
}

// BOTAO SACAR,BOTAO DEPOSITAR,BOTAO SAQUE RÁPIDO

function closeModalPix(){
    closeModal()
    $.post("https://ws-bank/fecharbanco")
}

function depositar(){

    $depositar = `<modal style="display:block;" id="modalDeposito" class="modalOpen">
                    <div class="title">Depositar</div>
                    <div class="modal-input">
                        <label>Quantidade R$</label>
                        <input type="number" id="valueDeposit" placeholder="EX: 500,000">
                    </div>
                    <button id="confirm" onclick="DepositMoney()"><svg class="svg-inline--fa fa-check fa-w-16 icon" aria-hidden="true" focusable="false" data-prefix="far" data-icon="check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M435.848 83.466L172.804 346.51l-96.652-96.652c-4.686-4.686-12.284-4.686-16.971 0l-28.284 28.284c-4.686 4.686-4.686 12.284 0 16.971l133.421 133.421c4.686 4.686 12.284 4.686 16.971 0l299.813-299.813c4.686-4.686 4.686-12.284 0-16.971l-28.284-28.284c-4.686-4.686-12.284-4.686-16.97 0z"></path></svg><!-- <i class="far fa-check icon"></i> Font Awesome fontawesome.com --> Confirmar</button>
                    <button id="cancelar" onclick="closeModal()"><svg class="svg-inline--fa fa-times fa-w-11 icon" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" data-fa-i2svg=""><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg><!-- <i class="fas fa-times icon"></i> Font Awesome fontawesome.com --> Cancelar</button>
                    <div class="modal-warning">
                        Preencha os campos corretamente antes de confirmar a ação!
                    </div>
                </modal>`
    $('.clasediv').html($depositar)
    $('.wrap').css('filter','blur(3px)')
}

function sacar(){

    $sacar = `<modal style="display:block;" id="modalDrop" class="modalOpen">
                <div class="title">Sacar</div>
                <div class="modal-input">
                    <label>Quantidade R$</label>
                    <input type="number" id="valueDrop" placeholder="EX: 500,000">
                </div>
                <button id="confirm" onclick="spawnMoney()"><svg class="svg-inline--fa fa-check fa-w-16 icon" aria-hidden="true" focusable="false" data-prefix="far" data-icon="check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M435.848 83.466L172.804 346.51l-96.652-96.652c-4.686-4.686-12.284-4.686-16.971 0l-28.284 28.284c-4.686 4.686-4.686 12.284 0 16.971l133.421 133.421c4.686 4.686 12.284 4.686 16.971 0l299.813-299.813c4.686-4.686 4.686-12.284 0-16.971l-28.284-28.284c-4.686-4.686-12.284-4.686-16.97 0z"></path></svg><!-- <i class="far fa-check icon"></i> Font Awesome fontawesome.com --> Confirmar</button>
                <button id="cancelar" onclick="closeModal()"><svg class="svg-inline--fa fa-times fa-w-11 icon" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" data-fa-i2svg=""><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg><!-- <i class="fas fa-times icon"></i> Font Awesome fontawesome.com --> Cancelar</button>
                <div class="modal-warning">
                    Preencha os campos corretamente antes de confirmar a ação!
                </div>
            </modal>`
    $('.clasediv').html($sacar)
    $('.wrap').css('filter','blur(3px)')
}

function closeModal(){
    $('.modalOpen').fadeOut(1)
    $('.wrap').css('filter','blur(0px)')
}


// BOTAO CRIAR PIX, BOTAO EDITAR PIX, BOTAO REMOVER PIX

function create_pix(){

    $cpix = `<modal style="display:block;" id="modalDrop" class="modalOpen">
                <div class="title">CRIAR CHAVE</div>
                <div class="modal-input">
                    <label>SUA CHAVE</label>
                    <input maxlength="10" id="valueCreatePix" placeholder="ATÉ 10 CARACTERS">
                </div>
                <button id="confirm" onclick="CreatePix()"><svg class="svg-inline--fa fa-check fa-w-16 icon" aria-hidden="true" focusable="false" data-prefix="far" data-icon="check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M435.848 83.466L172.804 346.51l-96.652-96.652c-4.686-4.686-12.284-4.686-16.971 0l-28.284 28.284c-4.686 4.686-4.686 12.284 0 16.971l133.421 133.421c4.686 4.686 12.284 4.686 16.971 0l299.813-299.813c4.686-4.686 4.686-12.284 0-16.971l-28.284-28.284c-4.686-4.686-12.284-4.686-16.97 0z"></path></svg><!-- <i class="far fa-check icon"></i> Font Awesome fontawesome.com --> Confirmar</button>
                <button id="cancelar" onclick="closeModal()"><svg class="svg-inline--fa fa-times fa-w-11 icon" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" data-fa-i2svg=""><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg><!-- <i class="fas fa-times icon"></i> Font Awesome fontawesome.com --> Cancelar</button>
                <div class="modal-warning">
                    Preencha os campos corretamente antes de confirmar a ação!
                </div>
            </modal>`
    $('.clasediv').html($cpix)
    $('.wrap').css('filter','blur(3px)')
}

function edit_pix(){

    $epix = `<modal style="display:block;" id="modalDrop" class="modalOpen">
                <div class="title">EDITAR CHAVE</div>
                <div class="modal-input">
                    <label>SUA NOVA CHAVE</label>
                    <input maxlength="10" id="valueEditPix" placeholder="ATÉ 10 CARACTERS">
                </div>
                <button id="confirm" onclick="EditPix()"><svg class="svg-inline--fa fa-check fa-w-16 icon" aria-hidden="true" focusable="false" data-prefix="far" data-icon="check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M435.848 83.466L172.804 346.51l-96.652-96.652c-4.686-4.686-12.284-4.686-16.971 0l-28.284 28.284c-4.686 4.686-4.686 12.284 0 16.971l133.421 133.421c4.686 4.686 12.284 4.686 16.971 0l299.813-299.813c4.686-4.686 4.686-12.284 0-16.971l-28.284-28.284c-4.686-4.686-12.284-4.686-16.97 0z"></path></svg><!-- <i class="far fa-check icon"></i> Font Awesome fontawesome.com --> Confirmar</button>
                <button id="cancelar" onclick="closeModal()"><svg class="svg-inline--fa fa-times fa-w-11 icon" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" data-fa-i2svg=""><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg><!-- <i class="fas fa-times icon"></i> Font Awesome fontawesome.com --> Cancelar</button>
                <div class="modal-warning">
                    Preencha os campos corretamente antes de confirmar a ação!
                </div>
            </modal>`
    $('.clasediv').html($epix)
    $('.wrap').css('filter','blur(3px)')
}

// CRIAR PIX, EDITAR PIX, REMOVER PIX, ENVIAR PIX
function DepositPix(){

    let pixchave = document.querySelector('#textPix').value
    let pixvalue = document.querySelector('#valueDeposit').value

    if(pixvalue > 0 ) {
        if(pixchave == '' | pixchave == " "){
            return
        }else if(pixvalue == '' | pixvalue == " "){
            return
        }
        closeModalPix()
        $.post("https://ws-bank/pix",JSON.stringify({
            type: 'send',
            key: pixchave,
            value: pixvalue
        }),(data) => {
            if(data.retorno == 'sucesso'){
                $.post("https://ws-bank/getGraphic")
            }
        });
    }
}

function CreatePix() {
    let pixchave = document.querySelector('#valueCreatePix').value

    if(pixchave == '' | pixchave == " "){
        return
    }
    closeModal()
    $.post("https://ws-bank/pix",JSON.stringify({
        type: 'create',
        param: pixchave,
    }));
}

function EditPix(){
    let pixchave = document.querySelector('#valueEditPix').value

    if(pixchave == '' | pixchave == " "){
        return
    }
    closeModal()
    $.post("https://ws-bank/pix",JSON.stringify({
        type: 'edit',
        param: pixchave,
    }));
}

function remove_pix(){

    $.post("https://ws-bank/pix",JSON.stringify({
        type: 'delete'
    }));
}

// SACAR,DEPOSITAR,SAQUE RÁPIDO
function spawnMoney() {
    let money  = document.querySelector('#valueDrop').value
 
    if(money > 0){
        closeModal()
        $.post("https://ws-bank/money",JSON.stringify({
            type: 'drop',
            param: money,
        }),(data) => {
            if(data.retorno == 'sucesso'){
                $.post("https://ws-bank/getGraphic")
            }
        });
    }
}
function DepositMoney() {
    let money = document.querySelector('#valueDeposit').value
 
    // console.log(money)
    if(money > 0){
        closeModal()
        $.post("https://ws-bank/money",JSON.stringify({
            type: 'deposit',
            param: money,
        }),(data) => {
            if(data.retorno == 'depositar'){
                $.post("https://ws-bank/getGraphic")
            }
        });
    }
}
function ExpressSaque() {

    closeModal()
    $.post("https://ws-bank/money",JSON.stringify({
        type: 'express'
        }),(data) => {
            if(data.retorno == '1000'){
                $.post("https://ws-bank/getGraphic")
            }
        });
}

function open_transferencias() {

    $sendmoney = `<modal style="display:block;" id="modalDeposito" class="modalOpen">
        <div class="title">TED</div>
        <div class="modal-input">
            <label>ID:</label>
            <input id="textid" maxlength="10" placeholder="EX: 225">
            <label>VALOR DA TRANSFERENCIA</label>
            <input type="number" id="valueTed" placeholder="EX: 500,000">
        </div>
        <button id="confirm" onclick="SendMoney()"><svg class="svg-inline--fa fa-check fa-w-16 icon" aria-hidden="true" focusable="false" data-prefix="far" data-icon="check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M435.848 83.466L172.804 346.51l-96.652-96.652c-4.686-4.686-12.284-4.686-16.971 0l-28.284 28.284c-4.686 4.686-4.686 12.284 0 16.971l133.421 133.421c4.686 4.686 12.284 4.686 16.971 0l299.813-299.813c4.686-4.686 4.686-12.284 0-16.971l-28.284-28.284c-4.686-4.686-12.284-4.686-16.97 0z"></path></svg><!-- <i class="far fa-check icon"></i> Font Awesome fontawesome.com --> Confirmar</button>
        <button id="cancelar" onclick="closeModal()"><svg class="svg-inline--fa fa-times fa-w-11 icon" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" data-fa-i2svg=""><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg><!-- <i class="fas fa-times icon"></i> Font Awesome fontawesome.com --> Cancelar</button>
        <div class="modal-warning">
            Preencha os campos corretamente antes de confirmar a ação!
        </div>
    </modal>`
    $('.clasediv').html($sendmoney)
    $('.wrap').css('filter','blur(3px)')

}


function SendMoney(){

    closeModal()
    let tedid = document.querySelector('#textid').value
    let tedvalue = document.querySelector('#valueTed').value

    if(tedid > 0 ) {
        if(tedid == '' | tedid == " "){
            return
        }else if(tedvalue == '' | tedvalue == " "){
            return
        }
        $.post("https://ws-bank/money",JSON.stringify({
            type: 'send',
            id: tedid,
            value: tedvalue
        }),(data) => {
            if(data.retorno == 'ted'){
                $.post("https://ws-bank/getGraphic")
            }
        });
    }
}

function clear_trans() {

    $('.list-extract').html('')


    $.post("https://ws-bank/clearTrans",JSON.stringify({}),(data) => {
        if(data.retorno == 'sucesso'){
            $.post("https://ws-bank/getGraphic")
        }
    });

}

function activeTraffic(action){

    if(action.dataset.id == "h_multas"){
            
        if(inMultas == false) {
            inMultas = true
            $( "#ativo" ).removeClass( "active option" ).addClass( "option" );
            $( "#secundario" ).removeClass( "option" ).addClass( "active option" );

            // $('.left-section').fadeOut(0)
            
            $('#maskbank').fadeOut(0)
            $('#maskmultas').fadeIn(0)
        
            ConsultarMultas()
        }
    }else if(action.dataset.id == "h_banco"){

            inMultas = false
            $( "#secundario" ).removeClass( "active option" ).addClass( "option" );
            $( "#ativo" ).removeClass( "option" ).addClass( "active option" );
            
            // $('.left-section').fadeIn(0)
            $('#maskbank').fadeIn(0)
            $('#maskmultas').fadeOut(0)
        }
}

function ConsultarMultas(){
    $('.content-traffic').empty()
    $.post('https://ws-bank/multas',JSON.stringify({type: 'consultar'}),(data) => {

            MultasTotal = data.result
            if(MultasTotal == ''){
                $('.multasdiv').html('Parabéns você está de bem com o nosso banco!!')
                 $('.multasdiv2').html('Continue assim e nunca será bloqueado!')
            }else{
            MultasTotal.forEach((key,value) => {

                    $('.multasdiv').html('Você tem multas pendentes para pagar, corra!')
                    $('.multasdiv2').html('Caso não pague suas multas, você ficará bloqueado!')
                    $('.content-traffic').prepend(`
                        <label><label></label>
                        <div class="item active-item multa-item active" onclick="selectTraffic(this)" data-valor="${key.valor}" data-motivo="${key.motivo}" data-dia="${key.data}" data-id="${key.id}" data-desc="${key.descricao}">
                            <div class="item-title flex-inline">
                                <div class="item-photo flex">w</div>
                                <small>${key.motivo}</small>
                            </div>
                            <div class="item-info">
                                <p>${key.data}</p>
                                <sub>#$</sub>
                            </div>
                            <div class="item-value">
                                <h3>R$ ${key.valor}</h3>
                            </div>
                        </div>
                    </label>`)
                })
            }
        })
}

function pay_select_multa(action){

    $.post("https://ws-bank/multas",JSON.stringify({
        type: 'pagar',
        id: action.dataset.id,
        valor: action.dataset.valor
    }),(data) => {
        if(data.message == 'sucesso'){
            $.post("https://ws-bank/getGraphic")
            ConsultarMultas()
            $('.pay-traffic').empty()
        }
    });
}


function selectTraffic(action){

    $('.pay-traffic').html(`<div class="pay-title">
        <div class="left flex-inline">
            <div class="pay-photo flex">wr</div>
            <div class="pay-info">
                <h3>${action.dataset.motivo}</h3>
                <sub>#${action.dataset.id}</sub>
            </div>
        </div>
        <button onclick="pay_select_multa(this)" data-valor="${action.dataset.valor}" data-id="${action.dataset.id}">Pagar multa selecionada</button>
    </div>
    <div class="pay-card">
        <div class="pay-tabel wrap">
            <h1>Detalhes</h1>
            <!-- Informações -->
            <label>Motivo</label>
            <span id="typeTraffic">${action.dataset.motivo}</span>
            <label>Valor da multa:</label>
            <span>R$ <span id="priceTraffic">${action.dataset.valor}</span></span>
            <label>Nº Multa</label>
            <span>#<span id="numberTraffic">${action.dataset.id}</span></span>
            <label>Data da multa:</label>
            <span id="dateTraffic">${action.dataset.dia}</span>
            <label>Descrição:</label>
            <span id="noteTraffic">${action.dataset.desc}</span>
        </div>
        <div class="pay-fiscal">
            <div class="flex-inline">
                <div class="photo"></div>
                <div class="bar" style="margin-top: -20px !important;"></div>
            </div>
            <div class="flex-between">
                <div class="bar">
                    <div class="bar"></div>
                    <div class="bar"></div>
                    <div class="bar"></div>
                </div>
                <div class="bar">
                    <div class="bar"></div>
                    <div class="bar"></div>
                    <div class="bar"></div>
                </div>
                <div class="bar">
                    <div class="bar"></div>
                    <div class="bar"></div>
                    <div class="bar"></div>
                </div>
            </div>
            <div class="bar-footer">
                <div class="bar">
                    <div class="bar"></div>
                    <div class="bar"></div>
                    <div class="bar"></div>
                </div>
            </div>
        </div>
    </div>`)

}