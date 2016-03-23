require 'rails_helper'

RSpec.describe EnterprisePositionLevel::Level, type: :model do
  it{
    is_expected.to validate_presence_of(:name)
    is_expected.to validate_presence_of(:number)
    is_expected.to validate_uniqueness_of(:name)
    is_expected.to validate_uniqueness_of(:number)
  }

  describe "一个用户可以有一个级别" do
    it{
      user = create(:user)
      level1 = EnterprisePositionLevel::Level.create(name: "级别1", number: "1")
      level2 = EnterprisePositionLevel::Level.create(name: "级别2", number: "2")

      user.enterprise_position_level.set_enterprise_level level1
      user = User.find user.id.to_s
      expect(user.enterprise_position_level.enterprise_level).to eq(level1)

      user.enterprise_position_level.set_enterprise_level level2
      user = User.find user.id.to_s
      expect(user.enterprise_position_level.enterprise_level).to eq(level2)
    }
  end

end
