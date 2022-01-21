require 'plane'
require 'weather'


class Airport

  AIRPORT_CAPACITY = 10

  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = AIRPORT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    raise "stormy" if stormy?
    raise "plane already landed" if @planes.include?(plane)
    raise "no room" if full?
    add(plane)
  end

  def take_off(plane)
    raise "stormy" if stormy?
    remove(plane)
  end

  def stormy?
    @weather.stormy?
  end
  
  private

  def add(plane)
    @planes.push plane
    plane.landed = true
  end

  def remove(plane)
    plane.landed = false
    @planes.delete_if {|p| p.equal? plane}
  end

  def full?
    @planes.length == @capacity
  end

end
