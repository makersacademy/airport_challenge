require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :capacity, :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    selected_plane = plane
    fail "Unable to land due to stormy weather" if weather.stormy?
    fail "Airplane has already landed at this airport" if already_in_airport?(selected_plane)
    fail "This plane has already landed at a different airport" if selected_plane.landed
    fail "Airport full" if full?
    plane.land
    planes << plane
  end

  def take_off(plane)
    selected_plane = plane
    fail "This plane is already in transit" if selected_plane.in_transit
    fail "Plane is not at this airport" unless already_in_airport?(selected_plane)
    fail "Unable to take_off due to stormy weather" if weather.stormy?
    plane.take_off
    selected_plane = planes.select {|x| x == plane}
    planes.delete_if {|x| x == plane}
    selected_plane
  end

  private
  attr_reader :planes

  def full?
    planes.length >= capacity ? true : false
  end

  def already_in_airport?(selected_plane)
    (planes.include?(selected_plane)) ? true : false
  end

end
