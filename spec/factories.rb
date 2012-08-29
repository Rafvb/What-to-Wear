FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
  
  factory :item do
    description "White T-shirt"
    price 9.99
    brand "Esprit"
    date_bought 1.day.ago
    user
  end
end
