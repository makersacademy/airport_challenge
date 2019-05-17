class Airport

attr_reader :airport_store

  def initialize
    @airport_store = []
  end

  def landing_plane(plane, weather)
    if weather == "sunny"
      airport_store << plane
    end
  end

  def take_off(plane, weather)
    if weather == "sunny"
      airport_store.pop
    end
    # if airport_store.length == 0
    #   return "Plane has taken off from the airport"
    # end
  end

end