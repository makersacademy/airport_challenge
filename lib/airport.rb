class Airport
  attr_reader :plane, :capacity, :hanger
  CAPACITY = 10

  def initialize(capacity = CAPACITY) 
  @capacity = capacity
  @hanger = []
  end

def land(plane)

  raise "airport is full" if full?

  @hanger.push(plane)
end  

def take_off
  @hanger.pop
  return "plane has taken off and longer at airport"
end

private
def full? 
  @hanger.length >= @capacity
end

end