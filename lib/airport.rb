require_relative 'plane.rb'

class Airport
  attr_reader :planes, :capacity
  Default_capacity = 10

  def initialize(capacity=Default_capacity)
    @capacity = capacity
    @planes = []
  end

  def landing_plane(plane)
    fail "No space currently available" if full?
    @planes << plane
  end

  def full?
    @planes.count >= @capacity
  end

  def weather
    bad_weather = "Apologies due to bad weather you'll not be able to land!"
    good_weather = "Welcome, you're clear to land"
    random_number = rand(11)
    weather_result = random_number == 1 || random_number == 4 ? bad_weather : good_weather
    weather_result
  end

end
