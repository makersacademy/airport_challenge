# This is the airport class

class Airport
 
  attr_writer :full, :capacity

  def initialize(full = false)
    @capacity = 50
    @full = full
  end

  def capacity(capacity)
    @capacity = capacity
    p "Airport capacity is now #{@capacity}" 
  end

  def full?
    @full
  end

end
