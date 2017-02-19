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
    raise "Airport is full" if airport_full?
    raise "Too stormy for landing" if stormy?
    raise "Plane already landed" if @planes.include?(plane)
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    raise "Plane is already flying" if plane.in_flight
    raise "Airport is empty" if airport_empty?
    raise "Too stormy for take off" if stormy?
    plane.flying
    @planes.delete(plane)
  end


  private

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
