require_relative 'atc'
require_relative 'airport'

puts "Welcome to Air Traffic Control. For your training, please create a new plane by typing 'plane = Plane.new('name of plane')'"

class Plane
  include ATC
  attr_accessor :plane

  def initialize(name)
    @name = name
    plane_spotted
  end

  def plane_spotted
    puts "Plane named #{@name} has been spotted in the air. To ensure safety, you need to confirm the weather conditions and the airport capacity before we can allow descent."
    puts "To confirm we are not over-populated, please type in the airport capacity and airport population in this format: airport = Airport.new('population', 'capacity'). For example 'airport = Airport.new(10000, 30000)'. Please do not add commas."
  end
end
