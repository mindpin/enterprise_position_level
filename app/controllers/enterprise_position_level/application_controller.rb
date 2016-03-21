module EnterprisePositionLevel
  class ApplicationController < ActionController::Base
    layout "enterprise_position_level/application"

    if defined? PlayAuth
      helper PlayAuth::SessionsHelper
    end
  end
end