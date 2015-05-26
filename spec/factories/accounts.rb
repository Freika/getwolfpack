FactoryGirl.define do
  factory :account do
    sequence(:name) { |n| "string-#{n}" }
    sequence(:subdomain) { |n| "string-#{n}" }
  end

end
