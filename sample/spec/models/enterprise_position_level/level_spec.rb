require 'rails_helper'

RSpec.describe EnterprisePositionLevel::Level, type: :model do
  it{
    is_expected.to validate_presence_of(:name)
    is_expected.to validate_presence_of(:number)
  }

  it "属性" do
    level1 = EnterprisePositionLevel::Level.create(name: "级别1")
    expect(level1.respond_to?(:name)).to be true
    expect(level1.respond_to?(:number)).to be true
  end

  it "关系" do
    level1 = create(:enterprise_level)
    expect(level1.respond_to?(:groups)).to be true
  end

end
