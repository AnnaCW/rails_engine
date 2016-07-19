FactoryGirl.define do
  factory :merchant do
    name
    created_at "2012-03-27T14:53:59.000Z"
  end

  sequence :name do |n|
    "Name#{n}"
  end
end
