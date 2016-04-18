module EnterprisePositionLevel
  class Post
    # 职位
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name,   type: String

    has_and_belongs_to_many :enterprise_levels, class_name: "EnterprisePositionLevel::Level", inverse_of: :enterprise_posts

    validates :name, presence: true, uniqueness: true
  end
end
