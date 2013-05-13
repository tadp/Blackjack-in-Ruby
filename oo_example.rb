=begin
Agenda for Course
Week 1: Procedural Programming
Week 2: OO Programming
Week 3&4: Webapp blackjack game

Intro to Object Oriented Programming
-Motivations behind OOP
-Extracting nouns (classes) and verbs (methods) out of requirements
-Classes and Objects
-behavior (methods) and state (instance variables)
-Rubys OOP
  -inheritance
  -composition
  -getters and setters
  -class methods and variables

=end

#Key concepts:
# - classes are blueprints for objects
# - you instantiate objects from classes
# - classes model behaviors via methods, and store state via instance variables

module Swimmable
  def swim
    "Im swimming!"
  end
end

class Animal
  attr_accessor :name, :weight, :height
  # def whats_my_name #getter
  #   @name
  # end

  # def name = (new_name)#setter
  #   @name = new_name
  # end


  def initialize(name, weight, height)
    @name=name
    @weight=weight
    @height =height
  end

  def speak
    "speaking from Animal"
  end

end

class Dog < Animal
  include Swimmable
  @@count = 0 #class variable

  def initialize(name, weight, height)
    @name=name
    @weight=weight
    @height =height
    @@count += 1
  end

def self.total_dogs #class method
  "Total dogs from class method: " + @@count.to_s
end

  def whats_my_name
    @name
  end

  def speak
    "bark"
  end

  def fetch
    "fetching!"
  end
end

spot=Dog.new("spot", 100, 4)
puts spot.whats_my_name
puts spot.speak
puts spot.swim

puts spot.weight
spot.weight=75
puts spot.weight
puts Dog.total_dogs

