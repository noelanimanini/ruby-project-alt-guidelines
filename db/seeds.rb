Book.destroy_all
BookOrder.destroy_all
Bookstore.destroy_all

50.times do 
    Book.create(title: Faker::Book.title, author: Faker::Book.author, genre: Faker::Book.genre, rating: rand(1...5))
end 

50.times do 
    BookOrder.create(book_id: Faker::Code.isbn, bookstore_id: Faker::Code.nric) 
end 

# 50.times do 
#     BookStore.create(name: Faker::JapaneseMedia::SwordArtOnline.location, location: Faker::Address.community,  )
# end 

puts 'done'
