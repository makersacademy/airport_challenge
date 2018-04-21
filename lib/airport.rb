require_relative 'plane.rb'

class Airport

  def take_off
    Plane.new
  end

  def land(plane)
    plane
  end

  def plane
  end


end
