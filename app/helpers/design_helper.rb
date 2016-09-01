module DesignHelper
  def sidebar_css_class(active_item)
    return 'collapsible-header waves-effect waves-teal active' if ['typography', 'table', 'table_example'].include? active_item
    'collapsible-header waves-effect waves-teal'
  end

  def sidebar_component_class(active_item)
    return 'collapsible-header waves-effect waves-teal active' if ['player_card', 'match_card'].include? active_item
    'collapsible-header waves-effect waves-teal'
  end

  def sidebar_js_class(active_item)
    return 'collapsible-header waves-effect waves-teal active' if ['dropdown'].include? active_item
    'collapsible-header waves-effect waves-teal'
  end


end
