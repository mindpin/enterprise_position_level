FactoryGirl.define do
  factory :enterprise_post, class: EnterprisePositionLevel::Post do
    sequence :name do |n|
      "#{n}岗位"
    end
  end
end

