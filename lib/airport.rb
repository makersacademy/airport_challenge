class Airport
  attr_reader :capacity
  
  def initialize
    @capacity = 5
  end

  def full?
    false
  end
  
  def capacity=(capacity)
    @capacity = capacity if capacity >= 0
  end
  
  def weather
    :stormy
  end

  def enter(plane)
  end
  
  def exit(plane)
  end
  
end
