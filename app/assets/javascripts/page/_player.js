$(document).ready(function(){
  $('.player-tabs').tabs();
  $('#player_stat_table').bootgrid(
    {
      navigation: 0,
      converters: {
       numeric: {
           from: function (value) { return parseFloat(value).toFixed(1); },
           to: function (value) { return value.toString(); }
       }
      }
    }
  );
  $('#player_gamelog_table').bootgrid(
    {
      navigation: 0
    }
  );
});
