require_relative 'plane'
class Airport
  def land(plane)
    plane
  end

  def take_off(plane)
    "flight #{plane} has taken off from runway 1"
  end
end
