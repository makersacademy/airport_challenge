require './lib/plane.rb'

class Airport

  attr_accessor :stormy

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @stormy = false
  end

  def release_plane(plane, airport)
    is_it_stormy(airport)
    reasons_to_fail_releasing(airport)
    plane.flying = true
    planes.delete(plane)
  end

  def accept_plane(plane, airport)
    is_it_stormy(airport)
    reasons_to_fail_accepting(plane, airport)
    plane.flying = false
    planes << plane
  end

  private
  attr_reader :planes, :capacity

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

  def reasons_to_fail_releasing(airport)
    fail "No planes here to fly!" if empty?
    fail "Too stormy to fly!" if airport.stormy == true
  end

  def reasons_to_fail_accepting(plane, airport)
    fail "Airport full!" if full?
    fail "Plane already landed!" if plane.flying == false
    fail "Too stormy to land!" if airport.stormy == true
  end

end
