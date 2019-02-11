class Plane
  attr_accessor :airport

  def initialize(airport = Airport.new)
    @airport = airport
    @airport.landed_planes << self
  end

  def land(airport, stormy)
    raise "Error. Already landed. Take off first" unless @airport.nil?

    raise "Landing aborted: Stormy and Airport full" if stormy && airport.full?
      
    raise "Landing aborted: Stormy." if stormy
      
    raise "Landing aborted: Airport full." if airport.full?

    airport.landed_planes << self
    @airport = airport
  end

  def take_off(airport, stormy)
    raise "Error: already airborne." if self.airport.nil?
      
    raise "Take-off aborted. Weather is stormy" if stormy
    
    airport.landed_planes.delete(self)
    @airport = nil
  end
end
