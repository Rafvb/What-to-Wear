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
  
  factory :garment do
    brand "Esprit"
    description "White T-shirt"
    date_bought 1.day.ago 
    price 9.99
    user
  end
end
