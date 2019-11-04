class Plane
  attr_accessor :airport, :flying

  def initialize
    @flying = true
    @airport = ""
  end

  def flying?
    return @flying
  end

  def change_status(airport_id, flying_status)
    @airport = airport_id
    @flying = flying_status
  end

  def take_off(airport)
    fail "Can't take off due to stormy weather!" if airport.stormy?
    fail "This plane is already flying" if flying?
    fail "This plane is not at this airport" unless @airport == airport.airport_id

    airport.hangar.delete(self)
    change_status("", true)
    return airport
  end

  def land(airport)
    fail "Can't land due to stormy weather!" if airport.stormy?
    fail "Can't land, hangar is full!" if airport.full?
    fail "Plane already in airport!" if airport.in_airport?(self)
    
    airport.hangar << self
    change_status(airport.airport_id, false)
    return airport
  end

end
