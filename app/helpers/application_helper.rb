module ApplicationHelper


  def include_page_css

    (stylesheet_link_tag controller_asset_name, 'data-turbolinks-track' => true).html_safe
  end

  def include_page_js
    if controller_asset_name
      script_name = controller_asset_name
      (javascript_include_tag script_name, 'data-turbolinks-track' => true).html_safe
    end
  end

  def controller_asset_name
    controller_name_without_the_namespace = params[:controller].split('/').last
    DEFERRED_ASSET_NAMES[controller_name_without_the_namespace.to_sym] || DEFAULT_DEFERRED_ASSET_NAME
  end

  def format_datetime(datatime)
    datatime.strftime("%I:%M %p, %m/%d/%Y")
  end

  def format_date(datatime)
    datatime.strftime("%m/%d/%Y")
  end


  def short_position(text)
    POSITION_SHORT_NAME[text.to_sym]
  end

  def team_name_short(name)
    name[0..2].upcase
  end



  # Refactor
  def action_from_index(index)
    if index == 15
      'QUATER ENDS'
    else
      GAME_ACTION_LIST[index]
    end
  end

  def recording_quater(index)
    if index == 5
      return GAME_END_TEXT
    end
    index
  end

end
