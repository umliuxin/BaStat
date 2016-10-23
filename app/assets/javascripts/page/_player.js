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
     },
     formatters: {
       "percent": function(column,row){
           return parseFloat(row[column.id]).toFixed(1) + '%';
       },
       "uppercase-text": function(column,row){
         return row[column.id].toUpperCase();
       },
       "ratio": function(column,row){
           if (column.id == 'fg'){
             return row.fgm + ' / '+ row.fga;
           }
           else if (column.id == '3pt') {
             return row.tpm + ' / '+ row.tpa
           }
           else if (column.id == 'ft') {
             return row.ftm + ' / '+ row.fta
           }
       }
     }
    }
  );
  $('#player_gamelog_table').bootgrid({
      navigation: 0,
      formatters: {
        "game-link": function(column, row){
          return "<a href='/games/" + row.id + "'>" + row.gameoppo+ "</a>";
        },
        "percent": function(column,row){
            return parseFloat(row[column.id]).toFixed(1) + '%';
        },
        "ratio": function(column,row){
            if (column.id == 'fg'){
              return row.fgm + ' / '+ row.fga;
            }
            else if (column.id == '3pt') {
              return row.tpm + ' / '+ row.tpa
            }
            else if (column.id == 'ft') {
              return row.ftm + ' / '+ row.fta
            }
        }
    }
  });
});
