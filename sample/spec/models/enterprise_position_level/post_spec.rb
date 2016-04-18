require 'rails_helper'

RSpec.describe EnterprisePositionLevel::Post, type: :model do
  it{
    is_expected.to validate_presence_of(:name)
    is_expected.to validate_uniqueness_of(:name)
  }

  it "关系" do
    post1 = EnterprisePositionLevel::Post.create(name: "岗位1")
    expect(post1.respond_to?(:enterprise_levels)).to be true
  end

  #describe "一个用户可以同时有多个岗位" do
    #it{
      #user = create(:user)
      #post1 = EnterprisePositionLevel::Post.create(name: "岗位1", number: "1")
      #post2 = EnterprisePositionLevel::Post.create(name: "岗位2", number: "2")

      #user.enterprise_position_level.enterprise_posts << post1
      #user.enterprise_position_level.enterprise_posts << post2

      #user = User.find user.id.to_s
      #expect(user.enterprise_position_level.enterprise_posts).to match_array([post2, post1])
    #}
  #end

end
