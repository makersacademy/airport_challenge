require_relative 'plane'

class Airport
  def land(plane)
    raise "Airport is full" if plane
  end

  def take_off(plane)
    "The plane: #{plane} has taken off"
  end
end
