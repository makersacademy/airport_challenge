require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :capacity
  attr_reader :runway

  STANDARD_CAPACITY = 10

  def initialize(capacity = STANDARD_CAPACITY)
    @runway = []
    @stormy = Weather.new
    @capacity = capacity
  end

  def land_plane(inbound_plane)
    fail "Plane already landed" if already_landed(inbound_plane)
    fail "Too stormy to land" if storm_forecast
    fail "The airport is full" if reached_capacity
    inbound_plane.touch_down
    runway << inbound_plane
  end

  def take_off(departing_plane)
    fail "Plane not in this airport" if not_in_airport(departing_plane)
    fail "Too stormy to fly" if storm_forecast
    departing_plane.in_flight
    runway.delete(departing_plane)
  end

  private

  def storm_forecast
    @stormy.stormy?
  end

  def not_in_airport(departing_plane)
    !runway.include?(departing_plane)
  end

  def already_landed(inbound_plane)
    runway.include?(inbound_plane)
  end

  def reached_capacity
    runway.count == capacity
  end

  def in_other_airport(inbound_plane)
    inbound_plane.landed && !runway.include?(inbound_plane)
  end

end
