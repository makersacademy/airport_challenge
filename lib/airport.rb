require_relative 'plane'
require_relative 'weather'
class Airport

  AIRPORT_CAPACITY = 20

  attr_reader :capacity, :weather, :planes_in_airport

  def initialize(weather: Weather.new) # A little bit unsure about the syntax here
    @weather = weather
    @planes_in_airport = []
    @capacity = AIRPORT_CAPACITY
  end

  public

  def land(plane)
    fail "This plane is already landed." if !plane.airborne
    fail "Bad weather today. Cannot land." if weather.stormy_weather?
    fail "Sorry. Airport full. Go away." if full?
    plane.land_plane
    planes_in_airport << plane
  end

  def take_off(plane)
    fail "Bad weather today. Cannot take off." if weather.stormy_weather?
    fail "That plane is not in this airport" unless planes_in_airport.include? plane
    plane.take_off_plane
    planes_in_airport.delete(plane)
  end

  def change_capacity(number)
    self.capacity = number
  end

  private
  attr_writer :plane_in_airport, :capacity


  def full?
    planes_in_airport.count >= capacity
  end

end
