$('.js-match-cards-flip').click(function(){
  $('.match-card', this ).toggleClass('hide');
});

$('.js-to-game-url').click(function(event){
  event.stopPropagation();
  $(location).attr('href',$(this).data('url'));

});
