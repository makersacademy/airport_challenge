
class Airport
  def initialize
    @queue = []
    @capacity = 20
  end 

  def land(plane)
    raise 'Cannot land, airport full' if @queue.length >= @capacity
    @queue.push(plane) 
    
  end

  def take_off(plane)

  end

  def hangar
    @queue
    
  end
end