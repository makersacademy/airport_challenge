require_relative 'plane'

class Airport
  attr_reader :weather, :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = "Sunny"
    @planes = []
    @capacity = capacity
  end

  def change_weather
    roll == 6 ? @weather = "Stormy" : @weather = "Sunny"
  end

  def roll
    rand(1..6)
  end

  def take_off(plane)
    @weather == "Stormy" ? (raise "Stormy weather prohibits take off") : "#{@planes.delete(plane)} has taken off from the airport"
  end

  def land(plane)
    weather_check(plane)
  end

  def weather_check(plane)
    @weather == "Stormy" ? (raise "Stormy weather prohibits landing") : capacity_check(plane)
  end

  def capacity_check(plane)
    @planes.size >= @capacity ? (raise "Airport is at maximum capacity") : "#{@planes << plane} has landed at the airport"
  end


#Irb test method
  def story
    @weather = "Stormy"
  end
end
