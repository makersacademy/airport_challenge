class Plane
  def initialize
    @airport = nil
  end

  def land_at(airport)
    raise("Airplane cannot land while already landed") if at_the_airport?
    @airport = airport if airport.request_to_land(self)
  end
  
  def take_off
    raise("Airplane cannot take off while flying") unless at_the_airport?
    @airport = nil if @airport.request_to_take_off(self)
  end

  def at_the_airport?
    !@airport.nil?
  end
end
