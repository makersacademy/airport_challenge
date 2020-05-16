require_relative 'plane.rb'

class Airport

  def land(plane)
    @plane = plane
  end

  def take_off
    puts 'Plane has taken off'
  end

end
