require_relative  "plane.rb"

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def take(plane)
    @planes << plane
    true
  end

  def release(plane)
    @planes.delete(plane)
    true
  end

end
