require_relative 'plane.rb'

class Airport

  attr_reader :airborne_planes, :landed_planes

  def initialize
    @airborne_planes = [Plane.new(1), Plane.new(2)]
    @landed_planes = [Plane.new(1),Plane.new(1)]
  end

  def land_plane
    @landed_planes << @airborne_planes[0]
    @airborne_planes.delete_at(0)
  end

  def takeoff_plane
    take_off = @landed_planes[0]
    @airborne_planes << @landed_planes[0]
    @landed_planes.delete_at(0)
    "#{take_off} has left the airport"
  end

  def weather
  end

end

# test = Airport.new
# test.takeoff_plane
