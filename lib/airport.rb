require_relative 'plane'

class Weather

  def stormy?
    if weather == :stormy
      true
    else
      false
    end
  end

end

class Airport
attr_reader :plane, :capacity, :weather

  def initialize(capacity: 1, weather: Weather.new)
     @planes = []
     @weather = weather
     @capacity = capacity
  end

  def land(plane)
  fail 'Bad weather' if weather.stormy?

  @planes << plane
  end


  def takeoff(plane)
  fail 'Bad weather' if weather.stormy?
  @planes.pop
  end

  # private
  # attr_reader :weather

end
