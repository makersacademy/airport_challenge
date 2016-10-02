require_relative "plane.rb"

class Airport
  def initalize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
  end
end
