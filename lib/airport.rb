require_relative 'weather'

class Airport
  attr_reader :planes_in_airport, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_in_airport = []
    @capacity = capacity
  end

  def land(a_plane)
    fail "Plane already at airport" if check_plane?(a_plane)
    fail "Airport is full, cannot land" if airport_full?
    fail "Too stormy to land" if bad_weather?
    a_plane.landed
    @planes_in_airport << a_plane
  end

  def take_off(a_plane)
    fail 'Plane not at airport' unless a_plane.at_airport?
    fail "Too stormy to fly" if bad_weather?
    a_plane.taken_off
    @planes_in_airport.delete(a_plane)
  end

  private

  def bad_weather?
    Weather.new.stormy?
  end

  def airport_full?
    @planes_in_airport.size == capacity
  end

  def check_plane?(a_plane)
    planes_in_airport.include? a_plane
  end

end
