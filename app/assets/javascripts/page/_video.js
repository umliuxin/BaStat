// 2. This code loads the IFrame Player API code asynchronously.
var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// 3. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player1,player2;
function onYouTubeIframeAPIReady() {
  player1 = new YT.Player('video1', {
    height: '270',
    width: '480',
    videoId: 'k1Q6U5zSTCc',
    playerVars: {
      'start': 104
    },
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });
  player2 = new YT.Player('video2', {
    height: '270',
    width: '480',
    videoId: '_Laf960OBj8',
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });
}

// 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {
  // event.target.playVideo();
  if(event.target.a.id === 'video2'){
      event.target.mute();
  }
}

// 5. The API calls this function when the player's state changes.
function onPlayerStateChange(event) {
  if (event.data == 2){
    player1.pauseVideo();
    player2.pauseVideo();
  }
  if (event.data == 1){
    player1.playVideo();
    player2.playVideo();
  }
  if (event.data == 0){
    player1.stopVideo();
    player2.stopVideo();
  }
}
function stopVideo() {
  player.stopVideo();
}
