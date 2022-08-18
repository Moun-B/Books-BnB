# Books, Users, Offers, Rentals

require 'rest-client'

isbn13 = ['9780590353427',
   '9780545029360',
   '9788532519474',
   '9780439136358',
   '9780439139595',
   '9780439064873',
   '9789955084334',
   '9780261102439',
   '9780007637676',
   '9780060281373',
   '9781589942172',
   '9782290019436',
   '9780451168610',
   '9788497898614',
   '9781782010616',
   '9781974725779',
   '9781338185706',
   '9781438470467',
  #  '9780062491282',
   '9781620104163',
   '9780606375405'
]
status = []

puts "Destroying database..."
Offer.destroy_all
Book.destroy_all
Rental.destroy_all
User.destroy_all

puts "Creating users..."
User.create!(email: "kyle@books.com", password: "password", first_name: "Kyle", last_name: "Bokktastic")
User.create!(email: "mounir@books.com", password: "password", first_name: "Mounir", last_name: "Booksalot")
User.create!(email: "soufiane@books.com", password: "password", first_name: "Souffiane", last_name: "Booker")
User.create!(email: "mark@books.com", password: "password", first_name: "Mark", last_name: "Bookman")
puts "Created #{User.count} users!"

puts "Creating books..."
isbn13.each_with_index do |isbn, index|
  url = "https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&jscmd=data&format=json"
  book = JSON.parse(RestClient.get(url))["ISBN:#{isbn}"]

  Book.create!(
    title: book["title"],
    author: book["authors"][0]["name"],
    year: book["publish_date"],
    category: book["subjects"][0]["name"],
    isbn: book["identifiers"]["isbn_13"][0],
    description: book["description"] || 'none',
    cover_url: book["cover"]["large"] # || book["cover"]["medium"] || book["cover"]["small"]
  )
  puts "#{index} Created!"
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
    duration_end: Faker::Date.between(from: '2022-09-19', to: '2022-10-19'),
    status: rand(0..2),
    offer: Offer.all.sample,
    user: User.all.sample,
  )
end

puts "Created #{Rental.count} rentals!"

puts "Seeding complete!"
