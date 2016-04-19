module EnterprisePositionLevel
  class LevelGroup
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name,   type: String

    has_and_belongs_to_many :posts, class_name: "EnterprisePositionLevel::Post", inverse_of: nil

    has_and_belongs_to_many :levels, class_name: "EnterprisePositionLevel::UserPositionLevel", inverse_of: nil

    validates :name, presence: true, uniqueness: true
  end
end
