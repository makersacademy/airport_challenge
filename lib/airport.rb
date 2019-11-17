require "./lib/planes"

class Airport

  attr_reader :planes, :capacity

  DEFALTCAPACITY = 20

  def initialize(capacity = DEFALTCAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "There is no space avaliable!" if @planes.count >= capacity
    
    @planes << plane
  end

  def take_off
    @planes.pop
  end

end
