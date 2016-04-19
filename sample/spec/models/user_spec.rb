require 'rails_helper'

RSpec.describe User, type: :model do
  it "关系" do
    @user = create(:user)
    expect(@user.respond_to?(:user_position_level)).to be true
  end
end
