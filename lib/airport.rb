require './lib/plane.rb'

class Airport

attr_reader :hangar

  def initialize
    @hangar = [Plane.new]
  end

  def land(plane)
    @hangar << plane
  end

  def take_off(landed_planes)
    @hangar.delete_at(landed_planes)
  end

end
