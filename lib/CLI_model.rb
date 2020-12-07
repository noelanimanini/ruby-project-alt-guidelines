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
        puts "Fantastic! Please enter the #{input1} you'd like."
        input2 = gets.chomp
        Book.create(title: ("#{input2}"))
        puts "Awesome! An order of 1 '#{input2}' book has been placed."
        #my create method works, but the book.create(title:...), I want it to be versatile to author, genre and rating as well. 
        #edit the key for passing the input value to be apart of the script. 
    end

    def update 
        puts "Here are your most recent orders."
        puts BookOrder.all.ids
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
      puts BookOrder.all.pluck(:id) 
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
          puts "Here are the books you have in stock with their ID's and their titles. Would you like to change the book order '#{input}'? Please input the book id."
          puts Book.all.pluck(:id, :title)
          input6 = gets.chomp
          bo2 = Book.find("#{input6}").book_orders
          
          # bo2.update(book_id: "#{input6}")
          # puts "The order has been updated!"
        else input5 == 'Bookstore'
          puts 'donut'
        end 
      # puts "Great! Here is the book store id and the book id for this respective order. Would you like to change the bookstore or book id?"
      # puts Book.all.pluck(:title) 
      
      #1.with the user input, find the bookorder they want to update. 
      #2. next, use the instance update method on the book order you found. 
      # Book.all.select do |input| 
      #   BookOrder.create(book_id: "#{input}" )

    end 

  

    def destroy
      puts "We're sorry to hear that you want to delete your book order. Here are all your existing orders:"
      puts BookOrder.all.ids
      puts "Which BookOrder ID would you like to delete?"
      user_input = gets.chomp
      BookOrder.destroy("#{user_input}")
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
        elsif input == 'Book'
          puts "Here are the existing orders for the following Books:"
          puts Book.all.pluck(:title, :id)
        elsif input == 'Book Order'
          puts "Here are the existing Book Orders:"
          puts BookOrder.all.ids
        else
          self.greet
        end 

    end 

    def read
      puts "Here are all your available books"
      book =  Book.all.pluck(:title, :id)
      puts book
      # binding.pry
    end 

    
end 
