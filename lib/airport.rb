require 'weather'
class Airport
  attr_accessor :stormy, :capacity, :planes
  DEFAULT_CAPACITY = 100
  def initialize
    @stormy = Weather.new
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def stormy?
    @stormy
  end

  def land(plane)
    fail "The plane has already landed!" if @planes.include?(plane)

    fail "The plane can't be landed - it is stormy" if @stormy == true

    fail "The plane can't land - the airport is full" if @planes.count >= 100

    @planes << plane
  end

  def take_off(plane)
    fail "The plane can't take off - it is stormy" if @stormy == true

    fail "This plane is not at the airport!" unless @planes.include?(plane)

    @planes.delete(plane)
  end
end
