module ListOptions
  def list_all_books
    puts 'No list to display' unless @books.length.positive?
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    puts "\n"
    run
  end

  def list_people
    puts 'No list to display' unless @people.length.positive?

    @people.each do |person|
     puts "[#{person.class.name}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end

    puts "\n"
    run
  end

  def list_rental_per_person_id
    puts 'Enter the ID of the person'
    person_id = gets.chomp

    @rental.each do |rent|
      binding.pry
      if rent.person.id == person_id.to_i
        puts "Date: #{rent.date} '#{rent.title}' by #{rent.book.author}"
      else
        puts 'Record not found'
      end
      puts "\n"
    end

    run
  end

  def create_student
    puts "Enter student's name"
    name = gets.chomp

    puts "Enter student's Age"
    age = gets.chomp

    if age.to_i < 18
      puts "Parent's Permission? [Y/N]"
      parent_permission = gets.chomp.upcase
    end

    if parent_permission == 'N'
      student = Student.new('unknown', age, name, parent_permission: false)
      @people << student
      puts "student is under age and would require parent's permission"
    else

      student = Student.new('unknown', age, name, parent_permission: true)
      @people << student
      puts 'Student added'
    end
    puts "\n"
  end

  def create_teacher
    puts "Enter Teacher's name"
    name = gets.chomp

    puts "Enter Teacher's Age"
    age = gets.chomp

    puts "Enter teacher's specialization"
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name, parent_permission: true)
    @people << teacher
    puts 'Teacher added'
    puts "\n"
  end
end
