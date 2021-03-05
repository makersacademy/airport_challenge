require_relative 'planes'

class Airport
  def land(plane)
    true
  end

  def take_off(plane)
    true
  end

  def planes_at_airport(plane)
    [] << plane
  end
end
