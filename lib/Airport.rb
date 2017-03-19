require_relative "Weather"

class Airport
  include Weather
  attr_reader :landed_planes
  def initialize
    @landed_planes = []
  end

  def clear_landing(plane)
    fail "Too stormy to fly" if stormy?

  end

  def land(plane)
    fail "Only plane can control landing" if plane.flying?
    self.landed_planes << plane
    return "Landed Successfully"
  end

private

attr_writer :landed_planes

end
