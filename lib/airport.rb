class Airport
  def initialize
    @capacity = 5
    @landed_planes = []
  end

  attr_writer :capacity

  def land_plane(plane)
    fail "This plane is on the ground!" unless plane.flying?
    fail "Sorry, airport is full!" if @landed_planes.count == @capacity
    @landed_planes << plane
    plane.land
    "Plane successfully landed!"
  end

  def take_off(plane)
    fail "This plane is already flying!" if plane.flying?
    fail "There are no airplanes to take off!" if @landed_planes.empty?
    @landed_planes.delete(plane)
    "Plane successfully took off!"
  end
end
