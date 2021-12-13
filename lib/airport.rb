require_relative 'plane'
require_relative 'weather'

# Airport class
class Airport
  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end

  attr_reader :hangar
  attr_accessor :capacity

  def land(plane, _weather = @weather)
    raise('Plane already grounded') unless plane.airborne == true

    plane.landed
    @hangar << plane
  end

  def takeoff(weather = @weather)
    raise('No planes available') if @hangar == []

    return unless weather_clear?(weather)

    plane = @hangar.pop
    plane.taken_off
    plane
  end

  def space_available?
    @hangar.length < @capacity ? true : raise('No space available')
  end

  def weather_clear?(weather)
    weather.forecast == 'clear' ? true : raise('The weather is too stormy')
  end
end
