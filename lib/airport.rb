class Airport
    attr_reader :hangar
    attr_accessor :capacity

  CAPACITY = 10 
  DEFAULT_CAPACITY = 20 
  
  def initialize(capacity = CAPACITY)
    @hangar = []
    @capacity = capacity 
  end 

  def land(plane)
    fail "Unable to land as the airport is at full capacity" if @hangar.length >= CAPACITY # need to refactor to private method to adhere to SRP 
    @hangar.push(plane)
  end 

  def take_off(plane)
    "Plane is airborne"
  end 

end 