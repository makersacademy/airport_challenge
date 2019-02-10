class Airport
  attr_accessor :capacity

  def initialize(capacity = 10)
    @capacity = capacity 
  end

  def has?(plane)
    false
  end

  def full?
    true
  end
end
