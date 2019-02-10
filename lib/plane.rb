class Plane

  def initialize
    @airport = Airport.new
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
    if stormy
      puts "Take-off aborted."
    else
      airport.landed_planes.delete(self)
      @airport = nil
    end
  end
end
