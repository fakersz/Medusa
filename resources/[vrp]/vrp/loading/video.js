function onYouTubeIframeAPIReady() {
  var player;
  player = new YT.Player('YouTubeBackgroundVideoPlayer', {
      videoId: 'ewJM7RsFu2A', // Video ID SJYHLem7gV8            
      playerVars: {
        playlist: 'ewJM7RsFu2A', // Video ID
          autoplay: 1,        
          autohide: 1,
          disablekb: 1, 
          controls: 0,        
          showinfo: 0,        
          modestbranding: 1, 
          loop: 1,            
          fs: 0,             
          autohide: 0,         
          rel: 0,
          enablejsapi: 1
      },
      events: {
        onReady: function(e) {
            e.target.mute();
            e.target.setPlaybackQuality('highres');
        },
        onStateChange: function(e) {
          if(e && e.data === 1){
              var videoHolder = document.getElementById('home-banner-box');
              if(videoHolder && videoHolder.id){
                videoHolder.classList.remove('loading');				
              }
			  
			  var x = document.getElementById("myAudio");
				x.play();
				x.volume = 0.30;
          }else if(e && e.data === 0){
            e.target.playVideo()
          }
        }
      }
  });
}