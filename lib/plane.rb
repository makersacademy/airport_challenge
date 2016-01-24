class Plane

  def initialize
    @landed = true
    #airport.landed_planes << self
  end

  def land(airport)
    @landed = true
    add_to_airport_list_of_landed_planes(airport)
  end

  def take_off(airport)
    @landed = false
    remove_from_airport_list_of_landed_planes(airport)
  end

  private

  def add_to_airport_list_of_landed_planes(airport)
    airport.landed_planes << self
end

  def remove_from_airport_list_of_landed_planes(airport)
    airport.landed_planes.delete(self)
  end

end
