require './storage/save_data'
require './storage/load_data'
module CreateOptions
  include SaveData
  def create_person
    puts 'press 1 to create a student'
    puts 'press 2 to create a teacher'

    number = gets.chomp

    case number
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'You entered wrong number'
      puts "\n"
      run
    end

    run
  end

  def create_book
    puts 'Enter Book title'
    title = gets.chomp

    puts "Enter Author's name"
    author = gets.chomp

    new_book = Book.new(title, author)

    @books << { :title.to_s => new_book.title, :author.to_s => new_book.author }
    save_book(@books)
    puts 'New book created'

    puts "\n"
    run
  end

  def create_rental
    puts 'Pick a book from the following list(Enter the serial number)'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book['title']}, Author: #{book['author']}"
    end
    book_selected = gets.chomp.to_i

    puts 'Select a person from the following list(Enter the serial number and not the ID)'
    @people.each_with_index do |person, index|
      puts "#{index})  [#{person['person']}] Name: #{person['name']}, Age: #{person['age']}, ID: #{person['id']}"
    end

    person_selected = gets.chomp.to_i

    puts 'Enter date'
    date = gets.chomp.to_s

    new_rental = Rental.new(date, @books[book_selected], @people[person_selected])
    # binding.pry
    @rental << { :date.to_s => new_rental.date, :id.to_s => new_rental.person['id'],
                 :name.to_s => new_rental.person['name'], :title.to_s => new_rental.book['title'],
                 :author.to_s => new_rental.book['author'] }

    save_rental(@rental)
    puts 'Book rented successfully'
    puts "\n"

    run
  end
end
