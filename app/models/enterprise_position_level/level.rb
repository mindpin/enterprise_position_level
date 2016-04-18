module EnterprisePositionLevel
  class Level
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name,   type: String
    # 有多个级别
    field :number, type: Integer, default: 2

    # 关联职位
    has_and_belongs_to_many :enterprise_posts, class_name: "EnterprisePositionLevel::Post", inverse_of: :enterprise_levels

    has_and_belongs_to_many :user_position_levels, class_name: "EnterprisePositionLevel::UserPositionLevel"

    validates :name, presence: true, uniqueness: true
    validates :number, presence: true

    after_create :init_user_position_levels
    def init_user_position_levels
      enterprise_posts.each do |post|
        number.times do |level|
          user_position_levels.create number: level, enterprise_post: post #, name: "#{name}Lv#{level+1}", 
        end
      end
    end
  end
end
