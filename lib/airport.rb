class Airport
  attr_accessor :capacity
  
  def initialize
    @capacity = 5
  end

  def full?
    false
  end
  
  def enter(plane)
  end
  
  def exit(plane)
  end
  
end
