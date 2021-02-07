require_relative 'plane'

class Airport
  attr_reader :plane

  def initialize
    @planes_at_airport = []
  end

  def land(plane)
    prevent_landing
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

  def full?
    @planes_at_airport.length >= 20
  end

  def prevent_landing
    raise "Airport is currently full. You cannot land." if full?
  end

end
