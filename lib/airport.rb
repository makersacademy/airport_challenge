class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane, weather, landed = true)
    @stormy = weather.stormy?
    fail "Sorry plane has already landed!" if @planes.include? plane
    fail "Sorry, too stormy to land!" if @stormy
    plane.landed = landed
    @planes << plane
  end

  def take_off(plane)
    fail "Sorry, no planes!" if @planes.empty?
    plane.landed = false
    @planes.delete(plane)
  end

end
