module DesignHelper
  def sidebar_css_class(active_item)
    return 'collapsible-header waves-effect waves-teal active' if ['typography'].include? active_item
    'collapsible-header waves-effect waves-teal'
  end

  def sidebar_component_class(active_item)
    return 'collapsible-header waves-effect waves-teal active' if ['card'].include? active_item
    'collapsible-header waves-effect waves-teal'
  end


end
