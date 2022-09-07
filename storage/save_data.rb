require 'json'
module SaveData
  def save_book(book)
    File.write('./storage/book.json', JSON.generate(book))
  end

  def save_student(student)
    File.write('./storage/person.json', JSON.generate(student))
  end

  def save_teacher(teacher)
    File.write('./storage/person.json', JSON.generate(teacher))
  end

  def save_rental(rentals)
    File.write('./storage/rental.json', JSON.generate(rentals))
  end
end
