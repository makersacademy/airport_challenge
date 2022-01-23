# link to files on which this code is dependant
require_relative './plane'
require_relative './weather'

# create class Airport, and an attribute of capacity which is accessible outside of this class
class Airport
  attr_accessor :capacity, :weather

  # initialize the Airport class with a capacity of 5 by default
  def initialize(capacity = 5)
    @capacity = capacity
  end

  # generate an instance of weather
  def generate_weather
    @weather = Weather.new
    @weather = @weather.random_weather
  end

  # land a plane in the airport and decrease available capacity by 1, 
  # unless weather is stormy or capacity is zero (ie. airport full)
  def land(plane)
    raise if @weather == "Stormy"
    raise if @capacity.zero?
    @capacity -= 1
  end

  # instruct plane to take off and increase available capacity by 1, 
  # unless weather is stormy
  def take_off(plane)
    raise if @weather == "Stormy"
    @capacity += 1
  end
end
