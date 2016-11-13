
class Airport

  attr_reader :planes_landed, :planes_in_air

  def initialize
    @planes_landed = []
    @planes_in_air = []
  end


  def land_plane(plane)
    puts "This plane has landed"
    @planes_landed << plane
    @planes_in_air.pop
  end

  def take_off(plane)
    puts "All clear for take off!"
    @planes_in_air << plane
    @planes_landed.pop
  end

  def confirm
    @planes_landed
    @planes_in_air
  end

end

class Plane

end
