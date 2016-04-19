module EnterprisePositionLevel
  class UserPositionLevel
    include Mongoid::Document
    include Mongoid::Timestamps

    belongs_to :user, class_name: EnterprisePositionLevel.get_user_class_name, inverse_of: :user_position_level

    has_and_belongs_to_many :posts, class_name: "EnterprisePositionLevel::Post", inverse_of: nil
    has_and_belongs_to_many :levels, class_name: "EnterprisePositionLevel::Level", inverse_of: nil
  end
end
