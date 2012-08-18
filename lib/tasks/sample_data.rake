namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_items
    make_relationships
  end
end

def make_users
  admin = User.create!(name: "Raf Van Baelen",
                       email: "rafvanbaelen@gmail.com",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)

  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end
 
def make_items
  users = User.all(limit: 6)
  50.times do
    description = Faker::Lorem.sentence(5)
    price = 9.99
    date_bought = 1.day.ago
    users.each { |user| user.items.create!(description: description) }
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
