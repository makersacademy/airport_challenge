class Airport
  attr_accessor :planes, :capacity
  DEFAULT_CAPACITY = 1
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end
  
  def override_capacity(new_capacity)
    @capacity = new_capacity
    self
  end

  def empty?
    @planes.length.zero?
  end

  def full? 
    @planes.length >= @capacity
  end
end
