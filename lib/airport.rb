class Airport
    attr_reader :hangar, :capacity

  CAPACITY = 10
  
  def initialize
    @hangar = []
    @capacity = CAPACITY
  end 

  def land(plane)
    fail "Unable to land as the airport is at full capacity" if @hangar.length >= CAPACITY
    @hangar.push(plane)
  end 

  def take_off(plane)
    "Plane is airborne"
  end 

end 