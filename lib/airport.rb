require_relative 'plane'

class Airport
  def land(plane)
    plane
  end

  def take_off(plane)
    puts "Plane flew away"
    plane
  end

end
