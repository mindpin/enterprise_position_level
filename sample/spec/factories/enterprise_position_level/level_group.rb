FactoryGirl.define do
  factory :enterprise_level_group, class: EnterprisePositionLevel::LevelGroup do
    sequence :name do |n|
      "等级组#{n}"
    end
  end
end


