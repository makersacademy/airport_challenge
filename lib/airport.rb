require_relative 'plane'

class Airport

  def initialize
    @planes_at_airport = []
  end

  def land(plane)
    @planes_at_airport << plane
    return plane
  end

  def take_off(plane)
    if @planes_at_airport.include?(plane)
      @planes_at_airport.delete_at(@planes_at_airport.index(plane))
    end
    plane
  end

  def plane_at_airport?(plane)
    puts plane
    return true if @planes_at_airport.include?(plane)

    false
  end

end
