
class Airport
  def initialize(capacity)
    @queue = []
    @capacity = capacity
  end 

  def land(plane)
    raise 'Cannot land, airport full' if full?
    raise 'Cannot land, weather is stormy' if stormy?
    @queue.push(plane) 
    
  end

  def take_off(plane)

  end

  def hangar
    @queue
  end

  private 
  def full?
    @queue.length >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end
end