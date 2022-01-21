require 'plane'
require 'weather'

class Airport

  AIRPORT_CAPACITY = 10

  attr_reader :capacity, :planes, :weather

  def initialize(capacity = AIRPORT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land until weather conditions improve" if @weather.stormy?
    raise "Plane has already landed" if @planes.include?(plane)
    raise "Airport is at capacity" if full?
    add(plane)
  end

  def take_off(plane)
    raise "Cannot take off until weather conditions improve" if @weather.stormy?
    remove(plane)
  end

  private

  def add(plane)
    @planes.push plane
    plane.landed = true
  end

  def remove(plane)
    plane.landed = false
    @planes.delete_if { |p| p.equal? plane }
  end

  def full?
    @planes.length == @capacity
  end

end
