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

    @hangar << plane
  end

  def take_off(plane)
    fail "Bad weather! Taking off is forbidden!" unless forecast? 
 
    @hangar.delete(plane) 

  end  
end
