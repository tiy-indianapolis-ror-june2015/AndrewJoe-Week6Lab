# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  user = User.create(email: Faker::Internet.email,
              name: Faker::Name.name,
              bio: Faker::Lorem.sentence(2),
              pic: Faker::Avatar.image,
              password: "abc12345678",
              password_confirmation: "abc12345678")

  15.times do
    post = Post.create(body: Faker::Lorem.sentence(3))
    post.created_at = Faker::Time.between(500.days.ago, Time.now, :all)
    user.posts << post
  end
end
