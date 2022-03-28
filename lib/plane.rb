class Plane

  def initialize
    @state_of_plane = 'N/A'
  end

  def land(airport)
    raise "You cannot land whilst grounded at your current airport" if @state_of_plane == "grounded"

    airport.store_plane(self)
    @state_of_plane = "grounded"
    "Plane lands at the airport"
  end

  def take_off(airport)
    raise "You cannot take off from an airport whilst flying" if @state_of_plane == "flying"

    airport.remove_plane_from_hangar(self)
    @state_of_plane = "flying"
    "Plane takes off"
  end

end
