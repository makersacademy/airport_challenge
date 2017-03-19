require_relative 'plane'
require_relative 'weather'
class Airport

  AIRPORT_CAPACITY = 20

  attr_reader :capacity, :planes, :weather

  def initialize(weather: Weather.new)
    @weather = weather
    @planes = []
    @capacity = AIRPORT_CAPACITY
  end

  public

  def land(plane)
    if weather.stormy_weather?
      fail "Bad weather today. Cannot land."
    elsif full?
      fail "Sorry. Airport full. Go away."
    elsif plane.landed?
    fail "This plane is already landed."
    else
    plane.land_plane
    planes << plane
    end
  end

  def take_off(plane)
    if weather.stormy_weather?
    fail "Bad weather today. Cannot take off."
    elsif !planes.include? plane
    fail "That plane is not in this airport"
    else
    plane.take_off_plane
    planes.delete(plane)
    end
  end

  def set_capacity(number)
    @capacity = number
  end

private

  def full?
    planes.count >= capacity
  end

end
