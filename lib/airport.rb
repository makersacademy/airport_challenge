require "./lib/plane.rb"

class Airport
  attr_reader :planes, :condition_for_landing, :take_off

  def initialize
    @planes = []
  end

  def condition_for_landing(plane)
    raise "Plane on the ground, can't land" if plane.on_the_ground
    raise "Plane is not instructed to land at this airport" unless
    plane.airport_to_land == self
    true
  end

  def land(plane)
    raise "Plane is not instructed to land" unless condition_for_landing(plane)
    @planes << plane
    plane
  end

  def confirm_landing(plane)
    @planes.include?(plane)
  end

  def condition_for_takeoff(plane)
    raise "Plane in the air, can't take off" unless plane.on_the_ground
    raise "Plane in a different airport than the one its instructed to take off" unless plane.airport_take_off == plane.airport_to_land
    true
  end

  def take_off(plane)
    raise "Plane is not instructed to take off" unless condition_for_takeoff(plane)
    @planes.delete_at(planes.index(plane).to_i)
  end

  def confirm_take_off(plane)
    !@planes.include?(plane) && !plane.on_the_ground
  end

end
