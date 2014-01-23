# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(Boeken Natuurkunde Seks Overig).each do |board_title|
  Board.create(title: board_title)
end

10.times do
  User.create(name: Faker::Name.first_name, password: "foobar", password_confirmation: "foobar")
end

100.times do
  Topic.create(
    title: Faker::Lorem.words.join(" "),
    body: Faker::Lorem.paragraph,
    board_id: 1 + rand(4),
    user_id: 1 + rand(10))
end

100.times do
  Reply.create(
    body: Faker::Lorem.sentences.join(" "),
    topic_id: 1 + rand(100),
    user_id: 1 + rand(10))
end
