require_relative "plane.rb"

class Airport
  attr_reader :plane
  def land(plane)
    @plane = plane
  end
end