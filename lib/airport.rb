require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :hangar, :airport_name
  attr_accessor :stormy

  def initialize(airport_name, capacity=DEFAULT_CAPACITY)
    @airport_name = airport_name
    @capacity = capacity
    @hangar = []
    @stormy = false
  end

  def move_to_hangar(plane)
    fail "Only newly made planes can be moved to Hangar" unless plane.location == 'factory'
    fail "The hangar is full" if full?
    plane.update_location(airport_name)
    hangar << plane
  end

  def take_off(plane)
    check_weather
    fail "Plane not at this Airport" unless plane.location == airport_name
    fail "Bad weather" if stormy
    plane.update_location('in transit')
    plane.takes_off
    hangar.delete(plane)
  end

  def land(plane)
    check_weather
    fail "Plane is not flying" unless plane.location == 'in transit'
    fail "Bad weather" if stormy
    fail "The hangar is full" if full?
    plane.update_location(airport_name)
    plane.lands
    hangar << plane
  end

  private

  def full?
    hangar.count >= capacity
  end

  def check_weather
    @stormy = !stormy if rand(5) == 0 # 20% chance...
  end

end
