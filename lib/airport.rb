require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
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
    @planes_at_airport.count >= @capacity
  end

  def prevent_landing
    raise "Airport is currently full. You cannot land." if full?
  end

  def new_capacity(new_capacity = DEFAULT_CAPACITY)
    @capacity = new_capacity
  end

end
