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

    after_update :update_user_position_level
    def update_user_position_level
      # TODO 职位变化也需要处理
      # 级别变化
      if number_change
        old_number = number_change[0]
        new_number = number_change[1]
        if new_number > old_number
          # 新建
          ((old_number + 1)..new_number).each do |level|
            enterprise_posts.each do |post|
              user_position_levels.create number: level, enterprise_post: post #, name: "#{name}Lv#{level+1}", 
            end
          end
        else
          # 删除
          range = ((new_number + 1)..old_number).to_a
          user_position_levels.where(:number.in => range).destroy_all
        end
      end
    end
  end
end
