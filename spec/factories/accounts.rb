FactoryGirl.define do
  factory :account do
    sequence :name do |n|
      "string-#{n}"
    end
    sequence :subdomain do |n|
      "string-#{n}"
    end
  end

end
