require_relative "plane.rb"

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes, :capacity


  def initialize
    @planes = Array.new
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    return raise("Plane has already landed at airport") if @planes.include?(plane)
    @planes.push(plane)
  end
  def take_off(plane)
    return raise("Plane not at airport, cannot take off") unless @planes.include?(plane)
    @planes.delete(plane)
  end
end