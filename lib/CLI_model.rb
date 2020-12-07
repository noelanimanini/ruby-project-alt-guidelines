class CommandLineInterface
    def greet
        puts "Hello BookStore Owner, what are we doing today?"
        puts "1. Are we ordering more books?"
        puts "2. Do you want to update an existing order?"
        puts "3. Find a book? Bookstore? Or a book order?"
        puts "4. View all books available?"
        user_input = gets.chomp
        self.run(user_input)
    end

    def run(user_input)
        case user_input
        when "1" 
          self.create
        when "2"
          self.update
        when "3"
          self.find
        when "4"
          self.read
        else
          "Have a wonderful day!"
        end
    end 

    def create
        puts "Great! Would you like to create an order from a specific author, title, genre or rating(1-5)?"
        input1 = gets.chomp
        # Book.create(title:) mass assignment 
          if input1 == "title"
            puts "Here are all your titles:"
            puts Book.all.map {|book| book.title}
            puts "Which title would you like to create another order of?"
            input2 = gets.chomp
            bo1 = Book.find_by(title: "#{input2}").book_orders
            BookOrder.create(book_id: bo1)
            puts "Fantastic! an order of '#{input2}' has been created."
          elsif input1 == "author"
            puts "Here are all your authors:"
            puts Book.all.map {|book| book.author}
            puts "Which author would you like to create another order of?"
            input2 = gets.chomp
            bo1 = Book.find_by(author: "#{input2}").book_orders
            BookOrder.create(book_id: bo1)
            puts "Fantastic! an order of '#{input2}' has been created."
          elsif input1 == "genre"
            puts "Here are all your genre:"
            puts Book.all.map {|book| book.genre}
            puts "Which genre would you like to create another order of?"
            input2 = gets.chomp
            bo1 = Book.find_by(genre: "#{input2}").book_orders
            BookOrder.create(book_id: bo1)
            puts "Fantastic! an order of '#{input2}' has been created."
          elsif input1 == "rating"
            puts "Here are all your ratings:"
            puts 1
            puts 2
            puts 3
            puts 4
            puts 5
            puts "Which rating would you like to create another order of?"
            input2 = gets.chomp
            bo1 = Book.find_by(rating: "#{input2}").book_orders
            BookOrder.create(book_id: bo1)
            puts "Fantastic! a book order with the rating'#{input2}' has been created."
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

    def update 
        puts "Here are your most recent orders."
        BookOrder.all.each {|order| puts "Order id: #{order.id} Book: #{order.book.title} Store: #{order.book_store.name}"} 
        puts  "Would you like to add, delete or change an order?" 
        puts '1. add'
        puts '2. delete'
        puts '3. change an order '
        user_input2 = gets.chomp
        # user_input2 == "1" ? self.create : self.destroy
        if user_input2 == "1" 
            self.create 
        elsif user_input2 == "2"
            self.destroy
        else user_input2 == "3"
            self.update2
        end  
    end 

    def update2
      puts "Here are all of your current book orders (id)"
      BookOrder.all.each {|order| puts "Order id: #{order.id} Book: #{order.book.title} Store: #{order.book_store.name}"} 
      puts "Would you like to see which order has what books? Please input the id of the order you'd like to see"
      input = gets.chomp
      puts "Great! We have found the order, '#{input}' with their resepctive books"
        bo1 = BookOrder.find("#{input}").book_id
        puts Book.find(bo1).title
      puts "Would you like to change the book or bookstore?"  
      puts 'Book'
      puts 'Bookstore'
      input5 = gets.chomp
        if input5 == 'Book'
          puts "Here are the books you have in stock with their ID's and their titles. If you would like to change the book order '#{input}', please input the current book id."
          puts Book.all.pluck(:id, :title)
          input6 = gets.chomp
          bo2 = Book.find("#{input6}").book_orders
          puts "Awesome! Now please input the new book id:"
          puts Book.all.pluck(:id, :title)
          input7 = gets.chomp
          bo2.update(book_id: "#{input7}")
          puts "Great! Your book id for this order, '#{input}', has been updated!'"
          puts "To exit the program, please type 'exit'.  Otherwise, press any button"
          input = gets.chomp
          input == 'exit' ? exit! : self.greet

        else input5 == 'Bookstore'
          puts "Here are the bookstores with their ID's and their names. If you would like to change the book order '#{input}', please input the current bookstore id."
          puts BookStore.all.pluck(:id, :name)
          input8 = gets.chomp
          bo3 = BookStore.find("#{input8}").book_orders
          puts "Awesome! Now please input the new bookstore id:"
          puts BookStore.all.pluck(:id, :name)
          input9 = gets.chomp
          bo3.update(book_id: "#{input9}")
          puts "Great! Your book id for this order, '#{input}', has been updated!'"
          puts "To exit the program, please type 'exit'.  Otherwise, press any button"
          input = gets.chomp
          input == 'exit' ? exit! : self.greet
        end 

    end 

    def destroy
      puts "We're sorry to hear that you want to delete your book order. Here are all your existing orders:"
      puts BookOrder.all.ids
      puts "Which BookOrder ID would you like to delete?"
      user_input = gets.chomp
      BookOrder.destroy("#{user_input}")
      puts "Your order has been deleted!"
      puts "To exit the program, please type 'exit'.  Otherwise, press any button"
      input = gets.chomp
      input == 'exit' ? exit! : self.greet
    end

    def find
      puts "Which one would you like to find in the system? Please type 'BookStore', 'Book' or 'Book Order':"
      puts "1. Bookstore"
      puts "2. Book"
      puts "3. Book Order"
      input = gets.chomp
        if input == 'BookStore'
          puts "Here are the existing orders to the following BookStores:"
          puts BookStore.all.pluck(:name, :id)
          puts "To exit the program, please type 'exit'.  Otherwise, press any button"
          input = gets.chomp
          input == 'exit' ? exit! : self.greet
        elsif input == 'Book'
          puts "Here are the existing orders for the following Books:" 
          puts Book.all.pluck(:title, :id)
          puts "To exit the program, please type 'exit'.  Otherwise, press any button"
          input = gets.chomp
          input == 'exit' ? exit! : self.greet
        elsif input == 'Book Order'
          puts "Here are the existing Book Orders:"
          puts BookOrder.all.pluck(:id)
          puts "To exit the program, please type 'exit'.  Otherwise, press any button"
          input = gets.chomp
          input == 'exit' ? exit! : self.greet
          # puts "Which order would you like to see?"
          # input2 = gets.chomp
          # bo1 = BookOrder.find("#{input2}").book
          # bo2 = BookOrder.find("#{input2}").book_store
          # bo1.pluck
          # p bo2
        else
          self.greet
        end 

    end 

    def read
      puts "Here are all your available books"
      book =  Book.all.pluck(:title)
      puts "Would you like to order more books? Please enter 'yes' or 'no'"
      input = gets.chomp 
      input == 'yes' ? self.create : self.greet
    
    end 

    
end 
