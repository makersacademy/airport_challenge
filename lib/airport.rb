# airport challenge app
require_relative 'plane'

class Airport
 # attr_accessor so everyone can access to this var
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    raise "cannot land: airport full" if @planes.length >= @capacity
    @planes << plane
  end

  def take_off_plane(plane)
  end
end
