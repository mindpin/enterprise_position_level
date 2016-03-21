module EnterprisePositionLevel
  class Engine < ::Rails::Engine
    isolate_namespace EnterprisePositionLevel
    config.to_prepare do
      ApplicationController.helper ::ApplicationHelper

      Dir.glob(Rails.root + "app/decorators/enterprise_position_level/**/*_decorator.rb").each do |c|
        require_dependency(c)
      end
    end
  end
end
