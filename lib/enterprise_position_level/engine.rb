module EnterprisePositionLevel
  class Engine < ::Rails::Engine
    isolate_namespace EnterprisePositionLevel
    config.to_prepare do
      ApplicationController.helper ::ApplicationHelper

      Dir.glob(Rails.root + "app/decorators/enterprise_position_level/**/*_decorator.rb").each do |c|
        require_dependency(c)
      end

      EnterprisePositionLevel.get_user_class.class_eval do
        has_one :user_position_level, class_name: "EnterprisePositionLevel::UserPositionLevel", inverse_of: :user
      end
    end
  end
end
