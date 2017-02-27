$('.js-match-cards-flip').click(function(){
  $('.match-card', this ).toggleClass('hide');
});

$('.js-to-game-url').click(function(event){
  event.stopPropagation();
  $(location).attr('href',$(this).data('url'));
});

$('.js-season-select').click(function(e){
  event.preventDefault();
  var selectedId = $(this).data('seasonid');
  var btn = $('#season-dropdown-button');

  if (selectedId === 'ALL'){
    btn.text("ALL SEASONS");
  } else {
    btn.text($(this).text());
  }

  $('.result-item').each(function(){
    if (selectedId === 'ALL' || $(this).data('seasonid') === selectedId) {
      $(this).removeClass('hide');
    } else {
      $(this).addClass('hide');
    }
  });
});
