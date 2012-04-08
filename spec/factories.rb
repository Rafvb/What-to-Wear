FactoryGirl.define do
  factory :user do
    name     "Raf Van Baelen"
    email    "rafvb@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
