require_relative = 'plane'

class Airport

  def land (plane)
    plane
  end

  def take_off(plane)
    puts "#{plane} has taken off"
    return plane
  end

end
