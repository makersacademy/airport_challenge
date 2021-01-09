require './lib/plane'

class Airport

  attr_reader :hangar

  def initialize
    @hangar = Array.new
  end

  def land_plane(plane)
    return unless plane.landing_permission == true

    puts "landing plane"
    @hangar << plane
  end
end
