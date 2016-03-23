module EnterprisePositionLevel
  class UserPositionLevel
    include Mongoid::Document
    include Mongoid::Timestamps

    belongs_to :user, class_name: EnterprisePositionLevel.get_user_class_name

    has_and_belongs_to_many :enterprise_posts, class_name: "EnterprisePositionLevel::Post", inverse_of: nil
    belongs_to :enterprise_level, class_name: "EnterprisePositionLevel::Level"

    def set_enterprise_level level
      self.enterprise_level = level
      self.save
    end
  end
end
