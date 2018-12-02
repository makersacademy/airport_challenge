require_relative 'plane'

class Weather

  def stormy?
    weather = Weather.new
    if weather == :stormy
      true
    else
      false
    end
  end

end

class Airport
attr_reader :plane, :capacity, :weather
DEFAULT_CAPACITY = 10


def full?
  planes.count >= @capacity
end

  def initialize (weather: Weather.new)
     @planes = []
     @weather = weather
     @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
  fail 'Bad weather' if weather.stormy?
  fail 'Airport is full' if full?
  @planes << plane
  end


  def takeoff(plane)
  fail 'Bad weather' if weather.stormy?
  @planes.pop
  end

  # private
  # attr_reader :weather

end
