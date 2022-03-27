class Airport
  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def full?
    hangar.length >= capacity
  end

  def change_capacity(custom_capacity)
    @capacity = custom_capacity
  end

  def stormy?
  end
    
end
