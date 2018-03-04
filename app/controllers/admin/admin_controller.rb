module Admin

  class AdminController < ApplicationController

    layout 'application_admin'

    before_action :authenticate_model!
    before_action :set_current_season


    def set_current_season
      @current_season ||= Season.get_current_season
    end
  end


end
