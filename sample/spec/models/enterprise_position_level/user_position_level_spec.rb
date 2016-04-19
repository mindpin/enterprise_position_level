require 'rails_helper'

RSpec.describe EnterprisePositionLevel::UserPositionLevel, type: :model do
  it "属性" do
    @user_position_level = create(:user_position_level)
    expect(@user_position_level.respond_to?(:user)).to be true

    expect(@user_position_level.respond_to?(:posts)).to be true
    expect(@user_position_level.respond_to?(:levels)).to be true
  end
end

