class Airport

  attr_reader :capacity, :full
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @full = false
  end
  
  def full?
    @full
  end

  def full
    @full = true
  end
end
