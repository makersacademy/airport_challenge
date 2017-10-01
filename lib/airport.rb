class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane, weather, landed = true)
    fail "Sorry plane has already landed!" if @planes.include? plane
    fail "Sorry, too stormy to land!" if weather.stormy?
    plane.landed = landed
    @planes << plane
  end

  def take_off(plane, weather)
    fail "Sorry, no planes!" if @planes.empty?
    fail "Sorry, too stormy to take off!" if weather.stormy?
    plane.landed = false
    @planes.delete(plane)
  end

end
