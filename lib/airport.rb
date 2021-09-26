class Airport

  attr_reader :hangar

  def initialize(capacity=25)
    @hangar = []
    @capacity = capacity
  end 

  def land(plane)
    fail "Airport full" if is_full? 
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
  end

  def is_in_hangar?(plane)
    @hangar.include?(plane)
  end 

  def is_full? 
    @hangar.count >= @capacity
  end  
end 

  