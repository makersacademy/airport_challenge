require_relative 'plane'
require_relative 'weather'

class Airport
  MAX_CAPACITY = 20
  attr_accessor :capacity
  attr_reader :planes

  def initialize(capacity = MAX_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    check_landing_conditions(plane)
    plane.land
    @planes << plane
    plane
  end

  def take_off(plane)
    check_take_off_conditions(plane)
    plane.flying
    @planes.delete(plane)
  end

  private

  def check_landing_conditions (plane)
    raise "Plane already landed" if @planes.include?(plane)
    raise "Airport is full" if airport_full?
    raise "Too stormy for landing" if stormy?
  end

  def check_take_off_conditions(plane)
    raise "Too stormy for take off" if stormy?
    raise "Airport is empty" if airport_empty?
    raise "Plane is already flying" if plane.in_flight
    raise "Plane isn't located at this airport" if !@planes.include?(plane)
  end

  def stormy?
    Weather.new.randomize
  end

  def airport_full?
    @planes.count == capacity
  end

  def airport_empty?
    @planes.empty?
  end

end
