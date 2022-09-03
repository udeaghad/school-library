module CreateOptions
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
    @books << new_book
    puts 'New book created'

    puts "\n"
    run
  end

  def create_rental
    puts 'Pick a book from the following list(Enter the serial number)'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_selected = gets.chomp.to_i

    puts 'Select a person from the following list(Enter the serial number and not the ID)'
    @people.each_with_index do |person, index|
      puts "#{index})  [#{person.class.name}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end

    person_selected = gets.chomp.to_i

    puts 'Enter date'
    date = gets.to_s

    new_rental = Rental.new(date, @books[book_selected], @people[person_selected])
    @rental << new_rental
    puts 'Book rented successfully'
    puts "\n"

    run
  end
end
