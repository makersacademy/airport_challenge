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
    fail "Unable to land as the airport is at full capacity" if airport_full?
    @hangar.push(plane)
  end 

  def take_off(plane)
    "Plane is airborne"
  end 

  private

  def airport_full?
    hangar.length >= CAPACITY 
  end 


end 