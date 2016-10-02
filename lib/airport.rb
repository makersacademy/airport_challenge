require_relative 'plane.rb'

class Airport
attr_reader :plane

  def take_off
    Plane.new
  end

  def land(plane)
    raise 'Airport is full' if @plane
    @plane = plane
  end

end
