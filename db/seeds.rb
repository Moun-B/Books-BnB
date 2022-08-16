# Books, Users, Offers, Rentals

puts "Seeding database..."

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

10.times do
  User.all.each do |user|
    user.books << Book.all.sample
  end
end

puts "Created #{User.first.books.count} books for #{User.first.email}!"

# create offers and rentals
puts "Creating offers and rentals..."
User.all.each do |user|
  user.books.each do |book|
    Offer.create!(user: user, book: book)
    Rental.create!(user: user, offer: Offer.find_by(user: user, book: book))
  end
end

puts "Created #{Offer.count} offers and #{Rental.count} rentals!"
