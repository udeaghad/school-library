class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    # @date = date
    # @book = book
    # book.rental.push(self)

    # @person = person
    # person.rental.push(self)

    @date = date
    @book = book
    # binding.pry
    # book.rental << self
    @person = person
    # person.rental << self
    # person.add_rental(self)
  end
end
