module DesignHelper
  def side_bar_css_class(active_item)
    return 'collapsible-header waves-effect waves-teal active' if active_item == 'css'
    'collapsible-header waves-effect waves-teal'
  end
end
