class CommandLineInterface
    def greet
        puts "Hello BookStore Owner, what are we doing today?"
        puts "1. Order More Books"
        puts "2. Update an existing order"
        puts "3. Delete an order"
        puts "4. View all books available"
        user_input = gets.chomp
        puts self.run(user_input)
    end

    def run(user_input)
        case user_input
        when "1"
          "Do you know what book you would like to order?"
        when "2"
          "Here are your existing orders."
        when "3"
          "Here are your existing orders. Which one would you like to delete?"
        when "4"
          "Here are all your available books"
          Book.all
        else
          "Have a wonderful day!"
        end

        # puts "Ordering a book or updating an order? Please type in 'order' or 'update'"
        # order = gets.chomp() or update = gets.chomp()
        # puts ("Awesome! Here is your " + order) || puts "What would you like to update?"
    end 


end 
