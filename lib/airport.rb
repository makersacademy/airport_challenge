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
    "Plane successfully landed!"
  end

  def take_off(plane)
    if @landed_planes.count.positive?
      @landed_planes.delete(plane)
      "Plane successfully took off!"
    else
      "There are no airplanes to take off!"
    end
  end
end
