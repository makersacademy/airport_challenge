require_relative 'atc'
require_relative 'airport'

puts "Welcome to Air Traffic Control."
puts "Please create a new plane by typing 'plane = Plane.new('name of plane')'."
puts "Once created, type in 'plane.spotted'"

class Plane
  include ATC
  attr_accessor :plane

  def initialize(name)
    @name = name
  end

  def spotted
    puts "Plane named #{@name} has been spotted in the air."
    puts "You need to confirm the weather conditions and airport capacity."
    puts "Please type in the airplane capacity and population in this format:"
    puts "'data = Airport.new('population', 'capacity')'."
    return "For example 'data = Airport.new(100, 300)'."
  end

  def prepare_take_off
    puts "Once again, to confirm take-off, we must ensure maximum safety."
    return "Let's observe the weather forecast. Please type plane.confirm_weather_ascent."
  end
end
