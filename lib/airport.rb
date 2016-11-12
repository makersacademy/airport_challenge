require_relative 'plane.rb'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail "Plane is not in airport" unless in_airport?(plane)
    plane.take_off
    @planes.delete(plane)
    plane
  end

  private

  def full?
    @planes.count >= 50
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

end
