require_relative './plane'
# require_relative './weather'

class Weather

  WEATHER_TYPES = [:stormy, :stormy, :not_stormy, :not_stormy]

  def stormy?
    weather_types == :stormy
  end

  def weather_types
    @weather = WEATHER_TYPES.sample
  end
end


class Airport
  attr_reader :capacity, :weather, :stormy, :plane
  attr_accessor :planes

  DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new.stormy?)
    @stormy = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane = Plane.new)
    @plane = plane
    !@plane.flying || full? || bad_weather? ? raise("Cannot land") : @planes << @plane

    @plane.land
  end

  def takeoff(plane = @planes.first)
    @plane = plane
    @plane.flying || bad_weather? || @planes.empty? ? raise("Cannot takeoff") : @planes.delete_at(0)

    @plane.takeoff
  end

  def full?
    @planes.size >= @capacity
  end

  def bad_weather?
    @stormy
  end
end