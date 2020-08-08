class Airport
  attr_accessor :hangar, :capacity

  def initialize(capacity = 10)
    @hangar = []
    @capacity = capacity 
  end

  def forecast?
    return false if rand(2).zero?

    true
  end

  def land(plane)
    fail "Airport is full" if @hangar.length >= @capacity
    
    fail "Bad weather! Landing is forbidden at this airport at the moment!" unless forecast?
    
    fail "This plane isn't flying" if plane.status == "ground"

    @hangar << plane
  end

  def take_off(plane)
    fail "Bad weather! Taking off is forbidden!" unless forecast?
    
    fail "This plane is already in the air" if plane.status == "air" 
 
    @hangar.delete(plane) 

  end  
end
