require 'securerandom'
require_relative 'nameable_class'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  # Implement and Override Nameable correct_name method
  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(15)
puts person.correct_name