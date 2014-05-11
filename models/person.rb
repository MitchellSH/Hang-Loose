class Person
  attr_reader :errors
  attr_reader :id
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.create(name)
    person = Person.new(name)
    person.save
    person
  end

  def self.last
    statement = "Select * from person order by id DESC limit(1)"
    result = Environment.database_connection.execute(statement)
    unless result.empty?
      name = result[0]["name"]
      Person.new(name)
    end
  end

  def self.count
    statement = "Select count(*) from person;"
    result = Environment.database_connection.execute(statement)
    result[0][0]
  end

  def save
    statement = "Insert into person (name) values ('#{name}')"
    Environment.database_connection.execute(statement)
    true
  end
end
