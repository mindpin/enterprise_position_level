module EnterprisePositionLevel
  mattr_accessor :user_class_name
  class << self
    def get_user_class_name
      user_class_name || "User"
    end

    def get_user_class
      get_user_class_name.constantize
    end
  end
end

# 引用 rails engine
require 'enterprise_position_level/engine'
