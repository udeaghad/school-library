require './person'

class Student < Person
  def initialize(classroom)
    @classroom = classroom
  end

  def play_hooky
    return "¯\(ツ)/¯"
  end

end