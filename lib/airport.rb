require_relative 'plane.rb'

class Airport

  def initialize
    @planes = Array.new
    @airbound_planes = Array.new
  end

def land(plane)
  @planes << plane
end

def planes
  @planes
end

def takeoff
  @airbound_planes << @planes.shift
  @planes
end

def in_airport?(plane)
  @planes.include? plane

end

end
