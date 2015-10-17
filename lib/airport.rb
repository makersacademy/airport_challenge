require_relative 'plane'

class Airport

  attr_reader :good_weather, :capacity, :planes

DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @good_weather = true
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport is full!' if full?
    raise 'Plane has already landed and is in airport' if @planes.include?(plane)
    @good_weather ? (@planes << plane) : (raise 'Landing denied. Weather is stormy!')
  end

  def take_off
    raise 'Cannot take-off an already flying plane' unless @planes.length > 0
    @good_weather ? @planes.pop : (raise 'Take-off denied. Weather is stormy!')
  end

  def weather
    random = rand(2)
    random == 0 ? @good_weather = true : @good_weather = false
  end

  private
  def full?
    @planes.length >= @capacity
  end

end
