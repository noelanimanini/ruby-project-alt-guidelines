require_relative '../config/environment'


cli = CommandLineInterface.new
user = cli.greet 
cli.main(user)

# CommandLineInterface.new.greet
