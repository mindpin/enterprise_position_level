module EnterprisePositionLevel
  class << self
    def enterprise_position_level_config
      self.instance_variable_get(:@enterprise_position_level_config) || {}
    end

    def set_mount_prefix(mount_prefix)
      config = EnterprisePositionLevel.enterprise_position_level_config
      config[:mount_prefix] = mount_prefix
      EnterprisePositionLevel.instance_variable_set(:@enterprise_position_level_config, config)
    end

    def get_mount_prefix
      enterprise_position_level_config[:mount_prefix]
    end
  end
end

# 引用 rails engine
require 'enterprise_position_level/engine'
require 'enterprise_position_level/rails_routes'
