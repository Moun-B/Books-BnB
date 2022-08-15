# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating books..."
20.times do
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    year: rand(1900..2022),
    category: Book::CATEGORIES.sample,
    isbn: Faker::Code.isbn
  )
end

10.times do
  Offer.create!(
    price: rand(100..500),
    user_id: 1,
    book_id: rand(1..20)
)
end
puts "#{Book.count} and #{Offer.count} created !"
