require_relative "plane.rb"

class Airport
  attr_reader :planes

  def initialize
    @planes = Array.new
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