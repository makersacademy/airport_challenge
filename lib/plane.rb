class Plane
  attr_reader :airport
  DEFAULT_POSITION = 'In flight'
  
  def initialize
    @airport = DEFAULT_POSITION
  end

  def land(airport)
    fail 'Airport is full' if airport.full?

    @airport = airport
    airport.planes << self
  end

  def take_off
    fail 'Plane is already in flight' if @airport == DEFAULT_POSITION
    
    @airport.planes.delete(self)
    @airport = DEFAULT_POSITION
  end
end
