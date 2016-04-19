module EnterprisePositionLevel
  class Post
    # 职位
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name,   type: String
    field :number, type: String

    has_and_belongs_to_many :groups, class_name: "EnterprisePositionLevel::LevelGroup", inverse_of: :posts

    validates :name, presence: true
    validates :number, presence: true
  end
end
