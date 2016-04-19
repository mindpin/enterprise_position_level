require 'rails_helper'

RSpec.describe EnterprisePositionLevel::LevelGroup, type: :model do
  it{
    is_expected.to validate_presence_of(:name)
  }

  it "属性" do
    expect(create(:enterprise_level_group).respond_to?(:name)).to be true
  end

  it "关系" do
    @group = create(:enterprise_level_group)
    expect(@group.respond_to?(:posts)).to be true
    expect(@group.respond_to?(:levels)).to be true
  end
end
