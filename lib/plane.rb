require_relative 'atc'
require_relative 'airport'

puts "Welcome to Air Traffic Control. For your training, please create a new plane by typing 'plane = Plane.new('name of plane')'. Once created, type in 'plane.spotted'"

class Plane
  include ATC
  attr_accessor :plane

  def initialize(name)
    @name = name
  end

  def spotted
    "Plane named #{@name} has been spotted in the air. To ensure safety, you need to confirm the weather conditions and the airports' airplane capacity before we can allow descent. Please type in the airplane capacity and curent population in this format: 'data = Airport.new('population', 'capacity')'. For example 'data = Airport.new(100, 300)'."
  end

  def prepare_take_off
    "Once again, to confirm take-off, we must ensure maximum safety. Let's observe the weather forecast. Please type plane.confirm_weather_ascent."
  end
end
