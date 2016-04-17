require_relative "plane"

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land plane
    @planes << plane
  end

  def take_off plane
    fail "No planes in airport." if @planes.empty?
    @planes.delete(plane)
  end

end
