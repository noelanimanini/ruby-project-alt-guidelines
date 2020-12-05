class CommandLineInterface
    def greet
        puts "Hello BookStore Owner, what are we doing today?"
        puts "1. Are we ordering more books?"
        puts "2. Update an existing order"
        puts "3. Find an order"
        puts "4. View all books available"
        user_input = gets.chomp
        self.run(user_input)
    end

    def run(user_input)
        case user_input
        when "1" 
          puts "Great! Would you like to order more books from a specific author, title, genre or rating(1-5)?"
           genre = gets.chomp || title = gets.chomp || rating = gets.chomp || author = gets.chomp
           #how can i make this more complex to create an order of a book with these three components  that is easy for the user
          puts "Awesome! Your order is on the way"
        when "2"
          puts "Here are your most recent orders."
          puts BookOrder.all.ids
          puts  "Would you like to add to or delete an existing order? Please enter 'update' or 'delete'"
          update = gets.chomp || delete = gets.chomp
          #   update_result = BookOrder.  
          # if 

        when "3"
          "Here are your existing orders. Which one would you like to delete?"

        when "4"
          "Here are all your available books"

        else
          "Have a wonderful day!"
        end
    end 

    def response
      
    end 
end 
