require_relative 'plane.rb'

class Airport

  attr_reader :airborne_plane, :landed_plane

  def initialize
    @airborne_plane = [Plane.new(1), Plane.new(2)]
    @landed_plane = [Plane.new(1),Plane.new(1)]
  end

  def land_plane
    @landed_plane << @airborne_plane[0]
    @airborne_plane.delete_at(0)
  end

  def takeoff_plane
    @airborne_plane << @landed_plane[0]
    @landed_plane.delete_at(0)
  end

end

 test = Airport.new
 print test.airborne_plane.count
