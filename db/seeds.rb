Book.destroy_all
BookStore.destroy_all
BookOrder.destroy_all

50.times do 
    Book.create(title: Faker::Book.title, author: Faker::Book.author, genre: Faker::Book.genre, rating: rand(1...5))
end 



50.times do 
    BookStore.create(name: Faker::JapaneseMedia::SwordArtOnline.location, location: Faker::Address.community, opening_time: "8AM", closing_time: "9PM" )
end 

50.times do 
    BookOrder.create(book_id: Book.all.sample.id, bookstore_id: BookStore.all.sample.id) 
end 

puts 'done'
