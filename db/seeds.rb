# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "suguruvvv@gmail.com", password: "Turtle06")

(1..10).each do |n|
  User.create!(
    name: "user_#{n}",
    email: "user_#{n}@test.com",
    password: "password"
  )
end

equipment_names = %w(
  懸垂器
  腹筋台
  アスレチックベンチ
  座位体前屈器
)

equipment_names.each { |name| Equipment.create!(name: name) }
