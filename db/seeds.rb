# Books, Users, Offers, Rentals

puts "Destroying database..."
Offer.destroy_all
Book.destroy_all
Rental.destroy_all
User.destroy_all

puts "Creating users..."
User.create!(email: "kyle@books.com", password: "password", first_name: "Kyle", last_name: "Bokktastic")
User.create!(email: "mounir@books.com", password: "password", first_name: "Mounir", last_name: "Booksalot")
User.create!(email: "souffiane@books.com", password: "password", first_name: "Souffiane", last_name: "Booker")
User.create!(email: "mark@books.com", password: "password", first_name: "Mark", last_name: "Bookman")
puts "Created #{User.count} users!"

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
puts "Created #{Book.count} books!"

# Create offers that have many rentals and belongs_to a book and a user
puts "Creating offers..."
10.times do
  Offer.create!(
    price: rand(100..999),
    book: Book.all.sample,
    user: User.all.sample
  )
end

puts "Created #{Offer.count} offers!"

puts "Creating rentals..."
10.times do
  Rental.create!(
    duration_start: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    offer: Offer.all.sample,
    user: User.all.sample
  )
end

puts "Created #{Rental.count} rentals!"

puts "Seeding complete!"
