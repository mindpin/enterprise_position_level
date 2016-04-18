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

  describe "更新后, 对应职级更新" do
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
end
