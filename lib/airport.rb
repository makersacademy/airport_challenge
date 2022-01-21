require_relative "plane"

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    puts "The plane is landed!"
    planes << plane
  end

  def takeoff_plane
    planes.pop
  end
end