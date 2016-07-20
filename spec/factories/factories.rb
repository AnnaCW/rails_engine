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

  factory :invoice do
    status "shipped"
    customer
    merchant
    created_at "2012-03-27T14:53:59.000Z"
    updated_at "2012-03-27T14:53:59.000Z"
  end

  factory :item do
    name
    description "This is an item description"
    unit_price 2
    merchant
    created_at "2012-03-27T14:53:59.000Z"
    updated_at "2012-03-27T14:53:59.000Z"
  end

  factory :transaction do
    credit_card_number
    credit_card_expiration_date "05/17"
    result "success"
    invoice
    created_at "2012-03-27T14:53:59.000Z"
    updated_at "2012-03-27T14:53:59.000Z"
  end

  sequence :credit_card_number do |n|
    "451555162373560#{n}"
  end

  factory :invoice_item do
    quantity 1
    unit_price 5
    item
    invoice
    created_at "2012-03-27T14:53:59.000Z"
    updated_at "2012-03-27T14:53:59.000Z"
  end
end
