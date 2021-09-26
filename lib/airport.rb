class Airport
  attr_reader :capacity, :terminal
  
  def initialize(capacity = 50)
    @capacity = capacity
    @terminal = []
  end

  def land(plane)
    raise 'airport is full' if @terminal.count >= capacity
    @terminal << plane
  end

  def take_off(plane)
    @terminal.pop

  end

end 
