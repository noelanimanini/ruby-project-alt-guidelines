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
    end

    def update 
        puts "Here are your most recent orders."
        puts BookOrder.all.ids
        puts  "Would you like to add to, delete or change an existing order?" 
        puts '1. add'
        puts '2. delete'
        puts '3. change a book or bookstore in a book order?'
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

    def update2(@str)
      @str = 'title' && 'author' && 'genre' && 'rating'
      puts "Change a Book in an order? Type 'Book'"
      puts "Change a BookStore in an order? Type 'BookStore'"
      user_input3 = gets.chomp
      if  user_input3 == 'Book'
      puts Book.new(@str: "#{user_input3}") 
      else
        puts 'donut ask me'
      end 
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
          puts BookStore.all.select(:name, :id)
        elsif input == 'Book'
          puts "Here are the existing orders for the following Books:"
          puts Book.all.select(:name, :id)
        elsif input == 'Book Order'
          puts "Here are the existing Book Orders:"
          puts BookOrder.all.ids
        else
          self.greet
        end 

    end 

    def read
      puts "Here are all your available books"
      book =  Book.all.select(:title, :id)
      puts book
      # binding.pry
    end 

    
end 
