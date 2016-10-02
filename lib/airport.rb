require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  DEFUALT_CAPACITY = 20
  attr_reader :planes, :capacity, :weather

  def initialize(capacity: DEFUALT_CAPACITY, weather: Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "Plane unable to land, airport full" if full?
    fail "Weather is too bad to land" if weather.stormy?
    plane.landed
    @planes << plane
    "The plane landed safely"
  end

  def take_off(plane)
    fail "Can't take off due to stormy conditions" if weather.stormy?
    if @planes.include?(plane)
      plane.flying
      @planes.delete(plane)
      "The plane has taken off"
    else
      fail "This plane is not in the airport"
    end
  end

  private

  def full?
    @planes.count >= @capacity
  end

end
