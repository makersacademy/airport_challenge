class Plane

  def land(airport)
    print "The plane has landed at #{airport}"
  end

  def takeoff(airport)
    if airport.plane_in_airport?(self)
      airport.plane_is_removed_from_available_fleet(self)
      return "The plane has taken off from #{airport}"
    else
      return "The plane is not in the airport"
    end
  end
end
