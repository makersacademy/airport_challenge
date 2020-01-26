# airport challenge app
require_relative 'plane'

class Airport
 # attr_accessor so everyone can access to this var
  def initialize(capacity)
    @capacity = capacity
    @all_landed = 0
  end

  def land_plane(plane)
    raise "can not land .FULL" if @all_landed >= @capacity
    @all_landed += 1
  end

  def take_off_plane(plane)
  end
end
