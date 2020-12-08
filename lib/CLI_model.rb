class CommandLineInterface
    def main(user)
        puts "hello! Bookstore #{user.name}"
        # puts "Hello BookStore Owner, what are we doing today?"
        puts "1. Are we ordering more books?"
        puts "2. Do you want to update an existing order?"
        puts "3. Find a Book? Bookstore? Or a book order?"
        puts "4. View all books available?"
        puts "5. To exit"
        user_input = gets.chomp
        self.run(user_input, user)

    end

    def greet
      puts "Hello human! What bookstore are you?"
      input = gets.chomp 
      b = BookStore.find_by(name: input)
      if b
        return b
      else 
        puts "NOT A BOOKSTORE"   
        greet
  
      end 
    end 

    def run(user_input, user)
      # puts "hello! Bookstore #{user.name}"
        case user_input
        when "1" 
          self.create_books(user)
        when "2"
          self.update_books(user)
        when "3"
          self.find_books(user)
        when "4"
          self.read_books(user)
        when "5"
          exit!
        else
          "Have a wonderful day!"
        end
    end 

    def create_books(user)
        puts "Great! Would you like to create an order from a specific author, title, genre or rating(1-5)?"
        input1 = gets.chomp
        # Book.create(title:) mass assignment 
          if input1 == "title"
            puts "Here are all your titles:"
            puts Book.all.map {|book| book.title}.uniq
            puts "Which title would you like to create another order of?"
            input2 = gets.chomp
            bo1 = Book.find_by(title: input2)
            BookOrder.create(book_id: bo1.id, book_store_id: user.id)
            puts "Fantastic! an order of '#{input2}' has been created."
            puts "To exit the program, please type 'exit'.  Otherwise, press any button"
            input = gets.chomp
            input == 'exit' ? exit! : self.main(user)
          elsif input1 == "author"
            puts "Here are all your authors:"
            puts Book.all.map {|book| book.author}.uniq
            puts "Which author would you like to create another order of?"
            input2 = gets.chomp
            bo1 = Book.find_by(author: input2)
            BookOrder.create(book_id: bo1.id, book_store_id: user.id)
            puts "Fantastic! an order of '#{input2}' has been created."
            puts "To exit the program, please type 'exit'.  Otherwise, press any button"
            input = gets.chomp
            input == 'exit' ? exit! : self.main(user)
          elsif input1 == "genre"
            puts "Here are all your genre:"
            puts Book.all.map {|book| book.genre}.uniq
            puts "Which genre would you like to create another order of?"
            input2 = gets.chomp
            bo1 = Book.find_by(genre: input2)
            BookOrder.create(book_id: bo1.id, book_store_id: user.id)
            puts "Fantastic! an order of '#{input2}' has been created."
            puts "To exit the program, please type 'exit'.  Otherwise, press any button"
            input = gets.chomp
            input == 'exit' ? exit! : self.main(user)
          elsif input1 == "rating"
            puts "Here are all your ratings:"
            puts 1
            puts 2
            puts 3
            puts 4
            puts 5
            puts "Which rating would you like to create another order of?"
            input2 = gets.chomp
            bo1 = Book.find_by(rating: input2)
            BookOrder.create(book_id: bo1.id, book_store_id: user.id)
            puts "Fantastic! a book order with the rating'#{input2}' has been created."
            puts "To exit the program, please type 'exit'.  Otherwise, press any button"
            input = gets.chomp
            input == 'exit' ? exit! : self.main(user)
          else
            exit!
          end 
        # puts "Fantastic! Please enter the #{input1} you'd like."
        # input2 = gets.chomp
        # Book.create(title: ("#{input2}"))
        # puts "Awesome! An order of 1 '#{input2}' book has been placed."
        # puts "To exit the program, please type 'exit'.  Otherwise, press any button"
          # input = gets.chomp
          # input == 'exit' ? exit! : self.greet
    end

    def update_books(user)
        puts "Here are your most recent orders."
        BookOrder.all.each {|order| puts "Order id: #{order.id} Book: #{order.book.title} Store: #{order.book_store.name}"} 
        puts  "Would you like to add, delete or change an order?" 
        puts '1. add'
        puts '2. delete'
        puts '3. change an order '
        user_input2 = gets.chomp
        # user_input2 == "1" ? self.create : self.destroy
        if user_input2 == "1" 
            self.create_books(user)
        elsif user_input2 == "2"
            self.destroy_books(user)
        elsif user_input2 == "3"
            self.update2(user)
        else 
          puts "To exit the program, please type 'exit'.  Otherwise, press any button"
          input = gets.chomp
          input == 'exit' ? exit! : self.main(user)
        end  
    end 

    def update2(user)
      puts "Here are all of your current book orders (id)"
      BookOrder.all.each {|order| puts "Order id: #{order.id} Book: #{order.book.title} Store: #{order.book_store.name}"} 
      puts "Please choose which order you'd like to update"
      input = gets.chomp
      puts "Great! We have found the order, '#{input}' with their resepctive books"
        bo1 = BookOrder.find("#{input}").book_id
        bo2 = BookOrder.find("#{input}").book_store_id
        puts Book.find(bo1).title
      puts "Would you like to change the book or bookstore?"  
      puts 'Book'
      puts 'Bookstore'
      input5 = gets.chomp
        if input5 == 'Book'
          puts "If you would like to change the book order book, '#{Book.find(bo1).title}', please input this book's id number: #{bo1}, to change the order."
          input6 = gets.chomp
          bo2 = Book.find("#{input6}").book_orders
          puts "Awesome! Now please input the new book id:"
          BookOrder.all.each {|order| puts "Book: #{order.book.title} Book ID: #{order.book_id}"}
          input7 = gets.chomp
          bo2.update(book_id: input7)
          puts "Great! Your book id for this order, '#{input}', has been updated!'"
          puts "To exit the program, please type 'exit'.  Otherwise, press any button"
          input = gets.chomp
          input == 'exit' ? exit! : self.main(user)

        else input5 == 'Bookstore'
          puts "If you would like to change the book order book location for: '#{Book.find(bo1).title}', please input this book's id number: #{bo2}, to change the order."
          input8 = gets.chomp
          bo3 = BookStore.find("#{input8}").book_orders
          puts "Awesome! Now please input the new bookstore id:"
          BookOrder.all.each {|order| puts "BookStore: #{order.book_store.name} Book Store ID: #{order.book_store_id}"}.uniq
          input9 = gets.chomp
          bo3.update(book_id: input9)
          puts "Great! Your book id for this order, '#{input}', has been updated!'"
          puts "To exit the program, please type 'exit'.  Otherwise, press any button"
          input10 = gets.chomp
          input10 == 'exit' ? exit! : self.main(user)
        end 

    end 

    def destroy_books(user)
      puts "We're sorry to hear that you want to delete your book order. Here are all your existing orders:"
      BookOrder.all.each {|order| puts "Order id: #{order.id} Book: #{order.book.title} Store: #{order.book_store.name}"}
      puts "Which BookOrder ID would you like to delete?"
      user_input = gets.chomp
      BookOrder.destroy("#{user_input}")
      puts "Your order has been deleted!"
      puts "To exit the program, please type 'exit'. Otherwise, press any button"
      input = gets.chomp
      input == 'exit' ? exit! : self.main(user)
    end

    def find_books(user)
      puts "Which one would you like to find in the system? Please type 'BookStore', 'Book' or 'Book Order':"
      puts "1. BookStore"
      puts "2. Book"
      puts "3. Book Order"
      input = gets.chomp
        if input == 'BookStore'
          puts "Here are the existing orders to the following BookStores:"
          puts BookStore.all.pluck(:name, :id)
          puts "To exit the program, please type 'exit'.  Otherwise, press any button"
          input = gets.chomp
          input == 'exit' ? exit! : self.main(user)
        elsif input == 'Book'
          puts "Here are the existing orders for the following Books:" 
          puts Book.all.pluck(:title, :id)
          puts "To exit the program, please type 'exit'.  Otherwise, press any button"
          input = gets.chomp
          input == 'exit' ? exit! : self.main(user)
        elsif input == 'Book Order'
          puts "Here are the existing Book Orders:"
          puts BookOrder.all.pluck(:id)
          puts "To exit the program, please type 'exit'.  Otherwise, press any button"
          input = gets.chomp
          input == 'exit' ? exit! : self.main(user)
          # puts "Which order would you like to see?"
          # input2 = gets.chomp
          # bo1 = BookOrder.find("#{input2}").book
          # bo2 = BookOrder.find("#{input2}").book_store
          # bo1.pluck
          # p bo2
        else
          self.main(user)
        end 

    end 

    def read_books(user)
      puts "Here are all your available books"
      BookOrder.all.each {|order| puts "Order id: #{order.id} Book: #{order.book.title} Store: #{order.book_store.name}"}
      puts "Would you like to order more books? Please enter 'yes' or 'no'"
      input = gets.chomp 
      input == 'yes' ? self.create : self.main(user)
    
    end 

    
end 
