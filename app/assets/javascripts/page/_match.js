$(document).ready(function(){
  $('.match-tabs').tabs();
  $('#match_boxscore_table').bootgrid(
    {
      navigation: 0,
      formatters: {
        "player-link": function(column, row)
        {
            return "<a href='/players/" + row.id + "'>" + row.name+ "</a>";
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
    }
  );
});
