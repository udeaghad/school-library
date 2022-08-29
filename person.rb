class Person
  @attr_accessor :name :age 
  @attr_reader :id
  def initialize(name = "unknown", age, parent_permission = "true")
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  private
  def is_of_age?
    age >= 18 ? true : false
  end

  public
  def can_use_services?
    is_of_age? || parent_permission ? true : false
  end
end