class Plane

  def land(airport)
    if airport.full?
      "This airport is full - cannot land"
    else
      airport.planes.push(self)
      "Landed"
    end
  end

  def take_off(_airport)
    "Took off"
  end

end
