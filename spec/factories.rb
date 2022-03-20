FactoryBot.define do
  factory :customer do
    association :territory, factory: :country
    sequence(:name) { |n| "Customer #{n}" }
    email { name.downcase.gsub(" ", "_") + "@example.com" }

    transient do
      order_count { 3 }
    end

    trait :with_orders do
      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.order_count, customer: customer)
      end
    end
  end

  factory :order do
    customer
    address_line_one { "85 2nd St" }
    sequence(:address_line_two) { |n| "#700 (#{n})" }
    address_city { "San Francisco" }
    address_state { "CA" }
    address_zip { "94110" }
  end
end