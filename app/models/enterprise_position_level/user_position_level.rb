module EnterprisePositionLevel
  class UserPositionLevel
    include Mongoid::Document
    include Mongoid::Timestamps

    #field :name,   type: String
    # 有多个级别
    field :number, type: Integer, default: 2

    has_and_belongs_to_many :users, class_name: EnterprisePositionLevel.get_user_class_name, inverse_of: :user_position_levels

    belongs_to :enterprise_post, class_name: "EnterprisePositionLevel::Post", inverse_of: nil
    belongs_to :enterprise_level, class_name: "EnterprisePositionLevel::Level"
  end
end
