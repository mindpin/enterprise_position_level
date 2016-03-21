module EnterprisePositionLevel
  class Routing
    # EnterprisePositionLevel::Routing.mount "/enterprise_position_level", :as => 'enterprise_position_level'
    def self.mount(prefix, options)
      EnterprisePositionLevel.set_mount_prefix prefix

      Rails.application.routes.draw do
        mount EnterprisePositionLevel::Engine => prefix, :as => options[:as]
      end
    end
  end
end
