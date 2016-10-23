// Initialize collapse button
  $(".button-collapse").sideNav();
  // Initialize collapsible (uncomment the line below if you use the dropdown variation)
  //$('.collapsible').collapsible();


$('.js-to-url').click(function(e){
  e.preventDefault();
  $(location).attr('href',$(this).data('url'));

});
