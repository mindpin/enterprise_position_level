require 'rails_helper'

RSpec.describe EnterprisePositionLevel::Level, type: :model do
  it{
    is_expected.to validate_presence_of(:name)
    is_expected.to validate_presence_of(:number)
    is_expected.to validate_uniqueness_of(:name)
  }

  it "属性" do
    level1 = EnterprisePositionLevel::Level.create(name: "级别1")
    expect(level1.respond_to?(:name)).to be true
    expect(level1.respond_to?(:number)).to be true

    # 默认
    expect(level1.number).to eq 2
  end

  it "关系" do
    level1 = EnterprisePositionLevel::Level.create(name: "级别1", number: "1")
    expect(level1.respond_to?(:enterprise_posts)).to be true
    expect(level1.respond_to?(:user_position_levels)).to be true
  end

  it "新建后，自动创建对应职级" do
    @post = EnterprisePositionLevel::Post.create name: "技术岗位"

    @level1_number = 1
    level1 = EnterprisePositionLevel::Level.create(name: "技术", number: @level1_number, enterprise_posts: [@post])
    expect(level1.user_position_levels).to be_any
    expect(level1.user_position_levels.length).to eq @level1_number

    @level2_number = 2
    level2 = EnterprisePositionLevel::Level.create(name: "设计", number: @level2_number, enterprise_posts: [@post])
    expect(level2.user_position_levels).to be_any
    expect(level2.user_position_levels.length).to eq @level2_number
  end

  describe "更新" do
    describe "职级更新" do
      before do
        @origin_number = 3
        @post = EnterprisePositionLevel::Post.create name: "技术岗位"
        @level = EnterprisePositionLevel::Level.create(name: "技术", number: @origin_number, enterprise_posts: [@post])
      end

      it "级别增加" do
        @level_to = 8
        @level.update_attribute :number, @level_to
        expect(@level.user_position_levels.length).to eq @level_to
      end

      it "级别降低" do
        @level_to = 1
        @level.update_attribute :number, @level_to
        expect(@level.user_position_levels.length).to eq @level_to
      end
    end

    describe "选择岗位变化" do
      before do
        @origin_number = 2
        @posts = [create(:enterprise_post), create(:enterprise_post)]
        @post_add = create(:enterprise_post)
      end

      it "移除岗位" do
        @level = EnterprisePositionLevel::Level.create(name: "技术", number: @origin_number, enterprise_posts: @posts)
        @post = @posts.first
        post_ids = [@post.id]
        @level.update_attribute :enterprise_post_ids, post_ids
        expect(@level.user_position_levels.length).to eq (@origin_number)
        expect(@level.user_position_levels.where(enterprise_post: @post)).to be_any
      end

      it "增加岗位" do
        @level = EnterprisePositionLevel::Level.create(name: "技术", number: @origin_number, enterprise_posts: @posts)
        @post_add = create(:enterprise_post)
        post_ids = @posts.map(&:id).push @post_add.id
        @level.update_attribute :enterprise_post_ids, post_ids
        expect(@level.user_position_levels.length).to eq (@origin_number * post_ids.length) # 2*3 =6
        expect(@level.user_position_levels.where(enterprise_post: @post_add)).to be_any
      end

      it "更换岗位" do
        @level = EnterprisePositionLevel::Level.create(name: "技术", number: @origin_number, enterprise_posts: @posts)
        @post_add = create(:enterprise_post)
        # 去除职位1， 加入职位3
        post_ids = @posts[1..1].map(&:id).push @post_add.id
        @level.update_attribute :enterprise_post_ids, post_ids
        expect(@level.user_position_levels.length).to eq (@origin_number * post_ids.length) # 2*2 =4
        expect(@level.user_position_levels.where(enterprise_post: @post_add)).to be_any
        expect(@level.user_position_levels.where(enterprise_post: @posts.first)).to_not be_any
      end

      # FIXME 增加职位同时改变职级需要处理
      #it "更换岗位, 同时提高级别数量" do
        #@target_number = 3
        #@level = EnterprisePositionLevel::Level.create(name: "技术", number: @origin_number, enterprise_posts: @posts)
        #@post_add = create(:enterprise_post)
        ## 去除职位1， 加入职位3, 级别数量2->3
        #post_ids = @posts[1..1].map(&:id).push @post_add.id
        ##@level.update_attribute :enterprise_post_ids, post_ids
        ##@level.update_attribute :number, @target_number
        #@level.assign_attributes enterprise_post_ids: post_ids, number: @target_number
        #@level.save
        #expect(@level.user_position_levels.length).to eq (@target_number * post_ids.length) # 2*3 =4
        #expect(@level.user_position_levels.where(enterprise_post: @post_add)).to be_any
        #expect(@level.user_position_levels.where(enterprise_post: @posts.first)).to_not be_any
      #end
    end
  end
end
