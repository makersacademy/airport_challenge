require_relative 'plane'

class Airport
  def land(plane)
    true
  end

  def takeoff(plane)
    true
  end

  def confirm(plane)
    return 1 if takeoff(plane)
  end
end
