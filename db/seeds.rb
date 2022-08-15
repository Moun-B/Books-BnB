# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying the database..."
Book.destroy_all
puts "Creating books..."
20.times do
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    year: rand(1900..2022),
    category: Book::CATEGORIES.sample,
    price: rand(100..500).truncate,
    isbn: Faker::Code.isbn
  )
end
puts "#{Book.count} created !"
