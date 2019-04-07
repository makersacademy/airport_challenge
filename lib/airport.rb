require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Plane has already landed!" unless plane.landed == false
    plane.landed = true
    @planes << plane
  end

  def take_off
    plane = @planes.shift
    plane.landed = false
    puts "#{plane} has taken off from #{self}"
    return plane
  end

end
