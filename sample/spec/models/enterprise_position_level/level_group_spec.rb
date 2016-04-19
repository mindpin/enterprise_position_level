require 'rails_helper'

RSpec.describe EnterprisePositionLevel::LevelGroup, type: :model do
  it{
    is_expected.to validate_presence_of(:name)
  }

  it "属性" do
    expect(create(:enterprise_level_group).respond_to?(:name)).to be true
  end
end
