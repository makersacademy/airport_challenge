require_relative 'weather'
require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_in_airport = []
    @capacity = capacity
  end

  def allow_land(a_plane)
    land_check_for(a_plane)
    a_plane.landed
    park(a_plane)
  end

  def allow_take_off(a_plane)
    take_off_check_for(a_plane)
    a_plane.taken_off
    remove(a_plane)
  end

  def planes_in_airport
    @planes_in_airport.dup
  end

  def capacity
    capacity = @capacity
  end

  private

  def land_check_for(a_plane)
    fail "Plane already at airport" if airport_has?(a_plane)
    fail "Airport is full, cannot land" if airport_full?
    fail "Too stormy to land" if bad_weather?
  end

  def take_off_check_for(a_plane)
    fail 'Plane not at airport' unless a_plane.at_airport?
    fail "Too stormy to fly" if bad_weather?
  end

  def park(a_plane)
    @planes_in_airport << a_plane
  end

  def remove(a_plane)
    @planes_in_airport.delete(a_plane)
  end

  def bad_weather?
    Weather.new.stormy?
  end

  def airport_full?
    @planes_in_airport.size == capacity
  end

  def airport_has?(a_plane)
    planes_in_airport.include? a_plane
  end
end
