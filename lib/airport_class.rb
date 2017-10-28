require_relative 'plane_class'

class Airport

  attr_reader :hangars

  def initialize
    @hangars = [Plane.new]
  end

  def land(plane)
    @hangars << plane
  end

  def take_off(plane_hangar)
    @hangars.delete_at(plane_hangar)
  end

end
