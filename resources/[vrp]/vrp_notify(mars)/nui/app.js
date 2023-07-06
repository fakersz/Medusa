$(document).ready(function(){
	window.addEventListener("message",function(event){
		if (event.data.timer > 0) {
			
			if (event.data.css == "sucesso") {
				var html = "<div class='notify'><div class='left'><img src='https://cdn.discordapp.com/attachments/863971735145545758/863995761213308958/Sucesso.png'></div><div class='right'><h1>Sucesso!</h1><p>"+event.data.mensagem+"</p></div></div>"
			} else if (event.data.css == "negado") {
				var html = "<div class='notify'><div class='left'><img src='https://cdn.discordapp.com/attachments/863971735145545758/863995759405039637/Negado.png'></div><div class='right'><h1>Negado!</h1><p>"+event.data.mensagem+"</p></div></div>"
			} else if (event.data.css == "aviso" || event.data.css == "importante") {
				var html = "<div class='notify'><div class='left'><img src='https://cdn.discordapp.com/attachments/863971735145545758/863995756984795136/Atencao.png'></div><div class='right'><h1>Aviso!</h1><p>"+event.data.mensagem+"</p></div></div>"
			} 
			// var html = "<div id='"+event.data.css+"'>"+event.data.mensagem+"</div>"
			$(html).fadeIn(500).appendTo(".container").delay(event.data.timer).fadeOut(500);
		}
	})
});
