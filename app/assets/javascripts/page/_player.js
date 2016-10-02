$(document).ready(function(){
  $('.player-tabs').tabs();
  $('#player_stat_table').bootgrid(
    {
      navigation: 0
    }
  );
  $('#player_gamelog_table').bootgrid(
    {
      navigation: 0
    }
  );
});
