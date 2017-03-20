require_relative 'plane'
require_relative 'weather'
class Airport

  AIRPORT_CAPACITY = 20

  attr_reader :capacity, :weather, :planes

  def initialize(weather: Weather.new) # A little bit unsure about the syntax here
    @weather = weather
    @planes = []
    @capacity = AIRPORT_CAPACITY
  end

  public

  def land(plane)
    fail "This plane is already landed." if plane.landed
    fail "Bad weather today. Cannot land." if weather.stormy_weather?
    fail "Sorry. Airport full. Go away." if full?
    plane.land_plane
    planes << plane
  end

  def take_off(plane)
    fail "Bad weather today. Cannot take off." if weather.stormy_weather?
    fail "That plane is not in this airport" unless planes.include? plane
    plane.take_off_plane
    planes.delete(plane)
  end

  def change_capacity(number)
    @capacity = number
  end

  private
  def full?
    planes.count >= capacity
  end

end
