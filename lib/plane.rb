class Plane
  attr_accessor :airport

  def initialize
    @airport = Airport.new
    @airport.landed_planes << self
  end

  def land(airport, stormy)
    if stormy && airport.full?
      raise "Landing aborted: Stormy and Airport full"
    elsif stormy
      raise "Landing aborted: Stormy."
    elsif airport.full?
      raise "Landing aborted: Airport full."
    else
      airport.landed_planes << self
      @airport = airport
    end  
  end

  def take_off(airport, stormy)
    if self.airport.nil?
      raise "Error: plane already in the air. Must land before taking off again!"
    elsif stormy
      raise "Take-off aborted. Weather is stormy"
    else
      airport.landed_planes.delete(self)
      @airport = nil
    end
  end
end
