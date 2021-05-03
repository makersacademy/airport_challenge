require_relative 'Plane'
require_relative 'Weather'

class Airport 
  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = 10)
    @capacity = capacity 
    @planes = []
  end

  def land(plane) 
    raise "ERROR! Airport is full, you cannot land" if @planes.count >= @capacity

    @planes.push(plane)
  end

  def take_off(plane)
    raise "ERROR! There are no aircraft to take off" if @planes.length == 0
    
    @planes.pop()
  end
end
