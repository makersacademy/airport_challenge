class Airport
  
  def initialize
    @capacity = 5
  end

  def full?
    false
  end
  
  def capacity
    @capacity
  end
  
  def capacity(to)
    @capacity = to
  end
end
