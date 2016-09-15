module DesignHelper
  def sidebar_component_class(active_item)
    return 'collapsible-header waves-effect waves-teal active' if ['typography', 'table', 'table_example', 'card_panel', 'dropdown'].include? active_item
    'collapsible-header waves-effect waves-teal'
  end

  def sidebar_match_class(active_item)
    return 'collapsible-header waves-effect waves-teal active' if [ 'match_card', 'match_header', 'match_stat', 'match_boxscore','match_playbyplay'].include? active_item
    'collapsible-header waves-effect waves-teal'
  end

  def sidebar_player_class(active_item)
    return 'collapsible-header waves-effect waves-teal active' if ['player_card'].include? active_item
    'collapsible-header waves-effect waves-teal'
  end

  def sidebar_team_class(active_item)
    return 'collapsible-header waves-effect waves-teal active' if ['team_header'].include? active_item
    'collapsible-header waves-effect waves-teal'
  end


end
