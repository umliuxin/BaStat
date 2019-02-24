$('#score_only_checkbox').change(function(){
  $('#score_only_field').toggleClass('hide');
});


$(window).on('keypress', function(e){

  if (e.shiftKey && e.which === 13){
    $('.admin-game-form input[type="submit"]').click();
  } else if (e.which === 45){
    $('[for="move_player_id_0"]').click();
  } else if (e.which === 61) {
    $('[for="move_player_id_-1"]').click();
  } else if (e.which > 48 && e.which < 58) {
    $('.playerkey'+ (e.which - 48)).click();
  } else{
    var upperId = '#key-' + e.which;
    var lowerKey = e.which - 32;
    var lowerId = '#key-' + lowerKey;
    if ($(upperId).length > 0 || $(lowerId).length > 0){
      $(upperId).click();
      $(lowerId).click();
    }
  }
});
