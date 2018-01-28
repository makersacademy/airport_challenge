require_relative "Plane"

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    raise "No planes available" if empty?
    @planes.delete(plane)
    "We have take off"
  end

  def empty?
    @planes.empty?
  end

end
