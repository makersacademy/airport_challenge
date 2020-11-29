require './lib/plane.rb'

class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land_plane(plane)
    @hangar << plane
  end
end
