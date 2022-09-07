require 'json'

module LoadData
  def load_books
    book_data = File.open('./storage/book.json')
    JSON.parse(book_data.read)
  end

  def load_people
    people_data = File.open('./storage/person.json')
    JSON.parse(people_data.read)
  end

  def load_rentals
    rental_data = File.open('./storage/rental.json')
    JSON.parse(rental_data.read)
  end
end
