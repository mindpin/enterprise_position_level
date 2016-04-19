module EnterprisePositionLevel
  class Level
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name,   type: String
    field :number, type: String

    has_and_belongs_to_many :posts, class_name: "EnterprisePositionLevel::Post", inverse_of: :levels

    validates :name, presence: true
    validates :number, presence: true
  end
end
