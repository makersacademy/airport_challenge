class Plane

  def initialize(airport)
    fail 'There is no room at the airport.' if airport_full?(airport)
    @landed = true
    add_to_airport_list_of_landed_planes(airport)
  end

  def land(airport, weather = airport.weather)
    fail 'This plane has already landed.' if @landed
    fail 'The weather is too stormy to land.' if weather.stormy?
    fail 'There is no room at the airport.' if airport_full?(airport)
    @landed = true
    add_to_airport_list_of_landed_planes(airport)
  end

  def take_off(airport, weather = airport.weather)
    fail 'This plane is already flying.' if !@landed
    fail 'This plane is not at the given airport.' if !airport.confirm_plane_landed(self)
    fail 'The weather is too stormy to take-off.' if weather.stormy?
    @landed = false
    remove_from_airport_list_of_landed_planes(airport)
  end

  private

  def add_to_airport_list_of_landed_planes(airport)
    airport.landed_planes << self
    airport.landed_planes_history << self
  end

  def remove_from_airport_list_of_landed_planes(airport)
    airport.landed_planes.delete(self)
  end

  def airport_full?(airport)
    airport.landed_planes.length >= airport.capacity
  end

end
