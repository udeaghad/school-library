module ListOptions
  def list_all_books
    puts 'No list to display' unless @books.length.positive?
    @books.each do |book|
      puts "Title: #{book['title']}, Author: #{book['author']}"
    end
    puts "\n"
    run
  end

  def list_people
    puts 'No list to display' unless @people.length.positive?

    @people.each do |person|
      puts "[#{person['person']}] ID: #{person['id']}, Name: #{person['name']}, Age: #{person['age']}"
    end

    puts "\n"
    run
  end

  def list_rental_per_person_id
    puts 'Enter the ID of the person'
    person_id = gets.chomp

    filter_rental = @rental.select { |item| item['id'] == person_id.to_i }

    if filter_rental.length.zero?
      puts 'Record not found'
    else
      filter_rental.each do |rent|
        puts "Date: #{rent['date']} '#{rent['title']}' by #{rent['author']}"
        puts "\n"
      end
    end

    run
  end

  def create_student
    puts "Enter student's name"
    name = gets.chomp

    puts "Enter student's Age"
    age = gets.chomp

    puts "Parent's Permission? [Y/N]"
    parent_permission = gets.chomp.upcase

    if parent_permission == 'N'
      student = Student.new('unknown', age, name, parent_permission: false)
      @people << { :person.to_s => student.class.name, :age.to_s => age, :name.to_s => name, :id.to_s => student.id,
                   :classroom.to_s => student.classroom, :parent_permission.to_s => student.parent_permission }

      puts "student is under age and would require parent's permission"
    else

      student = Student.new('unknown', age, name, parent_permission: true)

      @people << { :person.to_s => student.class.name, :age.to_s => age, :name.to_s => name, :id.to_s => student.id,
                   :classroom.to_s => student.classroom, :parent_permission.to_s => student.parent_permission }

      save_student(@people)
      puts 'Student added'
    end
  end

  def create_teacher
    puts "Enter Teacher's name"
    name = gets.chomp

    puts "Enter Teacher's Age"
    age = gets.chomp

    puts "Enter teacher's specialization"
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name, parent_permission: true)
    @people << { :person.to_s => teacher.class.name, :age.to_s => age, :name.to_s => name, :id.to_s => teacher.id,
                 :specialization.to_s => teacher.specialization, :parent_permission.to_s => teacher.parent_permission }

    save_teacher(@people)
    puts 'Teacher added'
    puts "\n"
  end
end
