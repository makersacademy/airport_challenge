require_relative 'plane'


class Airport

  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def land_plane(plane)
    @hangar << plane.landed
    plane
  end

  def planes_in_hangar
    @hangar
  end
end
