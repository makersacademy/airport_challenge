require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane, weather = Weather.new)
    grounded?(plane)
    airport_full?
    check_weather(weather)
    @planes << plane
    plane.is_grounded
    self
  end

  def take_off_plane(plane, weather = Weather.new)
    in_airport?(plane)
    check_weather(weather)
    @planes.delete(plane)
    plane.is_flying
    self
  end

  def grounded?(plane)
    fail "this plane is already grounded" if plane.state == "grounded"
  end

  def in_airport?(plane)
    fail "this plane isn't in this airport" unless @planes.include?(plane)
  end

  def airport_full?
    fail "can't land as airport is full" if @planes.length == @capacity
  end

  def check_weather(weather)
    fail "can't do that due to storms" if weather.condition == "stormy"
  end

end
