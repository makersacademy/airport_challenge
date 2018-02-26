require_relative 'weather.rb'
require_relative 'plane.rb'

class Airport
  attr_accessor :hanger, :todays_weather, :capacity

  def initialize(capacity = 1, weather = Weather.new)
    @capacity = capacity
    @hanger = []
    @todays_weather = weather.check_weather
  end

  def land(plane)
    # safety
    @hanger.push(plane)
    plane.status
  end

  def takeoff(plane)
    # safety
    @hanger.delete(plane)
  end

  def safety
    raise 'Bad weather' if stormy?
    raise 'Airport at full capacity' if full?
  end

  def stormy?
    @todays_weather == :stormy
  end

  def full?
    @hanger.count >= 2
  end
end
