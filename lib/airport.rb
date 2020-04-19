require_relative 'plane'

class Airport
  attr_reader :plane

  def initialize
    @plane = []
  end

  def take_off(plane)
    raise "This plane (#{plane}) has already taken off" if @plane.include?(plane) == false

    @plane.delete(plane)
    "#{plane} has taken off and is no longer at #{self}"
  end

  def land(plane)
    raise "This plane (#{plane}) has already landed" if @plane.include?(plane)

    @plane.push(plane)
    "#{plane} has landed"
  end
end
