require './lib/plane.rb'

class Airport

  attr_accessor :stormy, :capacity
  attr_reader :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @stormy = false
  end

  def release_plane(plane, airport)
    is_it_stormy(airport)
    reasons_to_fail_releasing(plane, airport)
    plane.in_flight
    planes.delete(plane)
  end

  def accept_plane(plane, airport)
    is_it_stormy(airport)
    reasons_to_fail_accepting(plane, airport)
    plane.land
    planes << plane
  end

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

  def weather_strength
    rand(100)
  end

  def is_it_stormy(airport)
    weather_strength > 50 ? airport.stormy = true : airport.stormy = false
  end

  def reasons_to_fail_releasing(plane, airport)
    fail "No planes here to fly!" if empty?
    fail "Too stormy to fly!" if airport.stormy == true
    fail "That plane isn't stored here!" if !(airport.planes.include? (plane))
  end

  def reasons_to_fail_accepting(plane, airport)
    fail "Airport full!" if full?
    fail "Plane already landed!" if (airport.planes.include? (plane))
    fail "Too stormy to land!" if airport.stormy == true
  end

end
