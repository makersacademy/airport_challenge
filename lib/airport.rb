class Airport
  attr_reader :capacity, :terminal
  
  def initialize(capacity = 50)
    @capacity = capacity
    @terminal = []
  end

  def land(plane)
    raise 'Cannot land - airport is full' if @terminal.count >= capacity
    @terminal << plane
  end

  def take_off(plane)
    raise 'Cannot take off - stormy weather' if stormy?
    @terminal.pop
  end

  def stormy?
    rand(0..5) > 4
  end 
end 
