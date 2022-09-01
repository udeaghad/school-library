# require_relative 'student'
# require_relative 'teacher'

module AppOptions
  def list_all_books
    puts "No list to display" unless @books.length > 0
    @books.each { |book|
    puts "Title: #{book.title}, Author: #{book.author}"
    }
    puts "\n"
    run
  end

  def list_people
    puts "No list to display" unless @people.length > 0

    @people.each {|person|
    puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    }

    puts "\n"
    run
  end

  def create_person
    puts "press 1 to create a student"
    puts "press 2 to create a teacher"

    number = gets.chomp

    case number
    when "1"
      puts "Enter student's name"
      name = gets.chomp
      
      puts "Enter student's Age"
      age = gets.chomp   

      puts "Parent's Permission? [Y/N]"
      parent_permission = gets.chomp.upcase
      
      
      if parent_permission == 'N'       
        student = Student.new('unknown', age, name, parent_permission: false)
        @people.push(student)
        puts "student is under age and would require parent's permission"
        puts "\n"
      else 
      
        student = Student.new('unknown', age, name, parent_permission: true)
        @people.push(student)
        puts "Student added"
        puts "\n"
      end

    when '2'
      puts "Enter Teacher's name"
      name = gets.chomp

      puts "Enter Teacher's Age"
      age = gets.chomp
      
      puts "Enter teacher's specialization"
      specialization = gets.chomp

      teacher = Teacher.new(specialization, age, name, parent_permission: true)
      @people.push(teacher)
      puts "Teacher added"
      puts "\n"

    else
      puts "You entered wrong number"
      puts "\n"
      run
    end
  
    run
  end

def create_book
  puts "Enter Book title"
  title = gets.chomp

  puts "Enter Author's name"
  author = gets.chomp

  new_book = Book.new(title, author)
  @books << new_book
  puts "New book creates"

  puts "\n"
  run
end
  
end
