class Airport

attr_reader :airport_store

  def initialize
    @airport_store = []
  end

  def landing_plane(plane)
    airport_store << plane
  end

  def take_off(plane)
    airport_store.pop
    if airport_store.length == 0
      return "Plane has taken off from the airport"
    end
  end

end