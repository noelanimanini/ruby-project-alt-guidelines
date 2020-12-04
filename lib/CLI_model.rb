class CommandLineInterface
    def greet
        puts 'Welcome in!'
        
    end

    def run 
        puts "What is your name?"
        name = gets.chomp()
        puts ("hello" + name)
        puts "what genre are you looking for"
        genre = gets.chomp()
        puts ("Here is a list of " + genre + " books")
        Bookstore.find_by(name: "Selmburg")
    end 


end 
