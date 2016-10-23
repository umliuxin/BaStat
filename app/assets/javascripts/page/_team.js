$('#team_gamelog_table').bootgrid({
    navigation: 0,
    formatters: {
      "game-link": function(column, row)
      {
          return "<a href='/games/" + row.id + "'>" + row.gameoppo+ "</a>";
      },
      "percent": function(column,row){

          return parseFloat(row[column.id]).toFixed(1) + '%';

      }
  }
});
