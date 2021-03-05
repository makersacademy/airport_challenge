require_relative 'planes'

class Airport
  def land(plane)
    true
  end

  def take_off
    true
  end

  def planes_at_airport(plane)
    [] << plane
  end
end
