require_relative "./plane"

class Airport
  
  DEFAULT_CAPACITY = 20
  attr_reader :plane_list
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane_list = []
    @capacity = capacity
  end

  def land(plane, airport)   
    raise "airport full" if full?
    raise "plane already exists at airport" if exists_at_airport?(plane, airport)
    raise "This plane is not in the air so cannot land again" if plane.in_air == false
    raise "There is a storm preventing landing" if storm?
    @plane_list << plane
    plane.in_air = false
  end

  def take_off(plane, airport)
    raise "Plane doesn't exist at airport, cant take-off" unless exists_at_airport?(plane, airport) 
    raise "There is a storm preventing take-off" if storm?
    # above also covers an in-air plane being allowed to take off,
    # as once a plane has taken off, it doesn't exist at any airport
    @plane_list.delete(plane)
    plane.in_air = true
  end

  private

  def full?
    @plane_list.length >= capacity
  end
  
  def storm?
    rand(20) == 20
  end

  def exists_at_airport?(plane,airport)
    airport.plane_list.include?(plane)
  end

end
