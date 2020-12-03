Book.destroy_all
BookOrder.destroy_all
BookStore.destory_all

50.times do 
    Book.create(title: Faker::Book.title, author: Faker::Book.author, genre: Faker::Book.genre)
    BookStore.create(name: Faker::Company.name)
    BookOrder.create(book_id: Book.all.sample.id, bookstore_id: Bookstore.all.sample.id, content: Faker::File.mime_type) 

