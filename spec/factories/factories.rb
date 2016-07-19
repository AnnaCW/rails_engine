FactoryGirl.define do
  factory :merchant do
    name
    created_at "2012-03-27T14:53:59.000Z"
    updated_at "2012-03-27T14:53:59.000Z"
  end

  sequence :name do |n|
    "Name#{n}"
  end

  factory :customer do
    first_name
    last_name
    created_at "2012-03-27T14:53:59.000Z"
    updated_at "2012-03-27T14:53:59.000Z"
  end

  sequence :first_name do |n|
    "FirstName#{n}"
  end

  sequence :last_name do |n|
    "LastName#{n}"
  end
end
