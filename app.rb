require_relative 'app_options'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
class App
  include AppOptions
  def initialize
    @books = []
    @people = []
    @rental = []
  end
  

  def options
    puts "Welcome to School library App!"
    puts "\n"
    puts "Please choose an option by entering a number"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a person given id"
    puts "7 - Exit"
  end

  def selected_number(number)
    case number
    when 1
      list_all_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
      
    when 6
      list_rental_per_person_id
      
    when 7
      exit
    else
      run
    end
  end

  def run
    options 
    puts "Enter a number"   
    number = gets.chomp.to_i

    if number < 8
    selected_number(number)
    else 
      options
      puts "Enter a number"   
      number = gets.chomp.to_i
      selected_number(number)
    end
  end
end

# action = App.new
# action.run