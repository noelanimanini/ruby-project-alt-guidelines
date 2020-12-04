class CommandLineInterface
    def greet
        puts 'Welcome in!'
    end

    def user_input
        puts "What genre book are you looking for?"
        genre = gets.chomp()
        puts ("great choice! " + genre + " is right over here:")
    end 

end 
 

