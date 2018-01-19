const YOUTUBE_KEY = 'AIzaSyCvg-1h9viFH2SCW9piZEq1CbiCtMg3QCs';
const CHANNEL_ID = 'UCpGB8Vaa8-IJpM2gVybJ7kg';
// const SAMPLE_LIST_URL = 'PL1m1bQm1Oe6OScdF_xxVovbSBuV0n4Hc1';

const $videoInput = $('#video-list-id'),
  $videoInputBtn = $('#video-import-submit'),
  $noResultText =$('#no-result');

var videoDetails = [];

const fetchVideoFromYoutube = e => {
  e.preventDefault();
  const videoListID = $videoInput.val();

  if (videoListID.length > 0) {
    $.ajax({
      cache: false,
      data: {
        key: YOUTUBE_KEY,
        part: 'snippet',
        channelId: CHANNEL_ID,
        playlistId: videoListID,
        maxResults: 20
      },
      dataType: 'json',
      type: 'GET',
      timeout: 5000,
      url: 'https://www.googleapis.com/youtube/v3/playlistItems'
    }).done((response) => {
      videoDetails = response.items;
      videoDetails = response.items.map((video) => {
        return serializeVideoDetail(video);
      });
      console.log(videoDetails);
      $('#playlist-result').html(JSON.stringify(videoDetails));
    }).fail(function() {
      $noResultText.html('No list matched');
    });
  } else {
    $noResultText.html('Please Input List ID');
  }
};

const serializeVideoDetail = (video) => {
  console.log(video)
  return {
    youtube_id: video.snippet.resourceId.videoId,
    ...fetchDataFromTitle(video.snippet.title)
  }
};

const fetchDataFromTitle = (title) => {
  return {
    gameday: title.split(' ')[0],
    team_1:   title.substr(title.indexOf(' ')).split('vs')[0].trim(),
    team_2:   title.substr(title.indexOf(' ')).split('vs')[1].trim(),
    gametime: title.split(' ')[0]
  };
}

const fetchVideosInit = () => {
  $videoInputBtn.on('click', fetchVideoFromYoutube);
};

if ($videoInput.length > 0) {
  fetchVideosInit();
}
