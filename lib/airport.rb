class Airport
  attr_reader :capacity
  attr_accessor :plane
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def land(plane)
    raise "Airport full" unless @plane.nil?

    raise "Plane is at another airport" if plane.grounded

    plane.airborne = false
    @plane = plane
  end

  def take_off(plane)

    raise "Plane is already in the air" if plane.flying

    plane.airborne = true
    @plane = plane
  end
end

class Plane
  attr_accessor :airborne, :airport_id

  def initialize(airborne = true)
    @airborne = airborne
    # @airport_id = airport_id

  end

  def flying
    @airborne == true
  end

  def grounded
    @airborne == false
  end
end

class Weather
end
