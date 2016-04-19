FactoryGirl.define do
  factory :enterprise_level, class: EnterprisePositionLevel::Level do
    sequence :name do |n|
      "级别#{n}"
    end
    sequence :number do |n|
      "Lv#{n}"
    end
  end
end

