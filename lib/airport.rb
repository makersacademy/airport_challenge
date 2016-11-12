require_relative  "plane.rb"
require_relative "weather.rb"

class Airport
  CAPACITY = 20
  attr_reader :planes
  attr_accessor :weather, :capacity

  def initialize(weather=Weather.new, capacity=CAPACITY)
    @weather = weather.random_weather
    @planes = []
    @capacity = CAPACITY
  end

  def take(plane)
    @planes << plane if @weather == "sunny"
    true
  end

  def release(plane)
   @planes.delete(plane) if @weather == 'sunny'
   true
  end

  def full?
    @planes.count == @capacity
  end

end
