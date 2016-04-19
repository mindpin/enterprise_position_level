require 'rails_helper'

RSpec.describe EnterprisePositionLevel::Post, type: :model do
  it{
    is_expected.to validate_presence_of(:name)
    is_expected.to validate_presence_of(:number)
  }

  it "属性" do
    post = create(:enterprise_post)
    expect(post.respond_to?(:name)).to be true
    expect(post.respond_to?(:number)).to be true
  end

  it "关系" do
    post = create(:enterprise_post)
    expect(post.respond_to?(:levels)).to be true
  end

end
