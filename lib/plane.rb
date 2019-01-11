require_relative 'airport'

class Plane
  attr_reader :state

  def initialize
    @state = 'Newly constructed'
  end

  def land(airport)
    raise 'Plane is not in flight' if @state == 'At airport'
    raise 'Airport is full' if airport.full?
    raise 'Weather is not safe to land' unless airport.safe?

    @state = 'At airport'
    airport.planes << self
    "#{self} has now landed at #{airport}"
  end

  def take_off(airport)
    raise 'This plane is not at airport' unless airport.planes.include?(self)
    raise 'Weather is not safe to take off' unless airport.safe?

    airport.planes.delete(self)
    @state = 'In flight'
    "#{self} has now left #{airport}"
  end

end
