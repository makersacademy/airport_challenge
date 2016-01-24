
class Plane


  def to_land_at(airport)
    if airport.planes.include? self.object_id
      "The plane can not land on an airport it is already in"
    else
      1000.times # i am landing}
      airport.landed_at(self.object_id)
    end
  end

  def take_off(airport)
    if airport.planes.include? self.object_id
      1000.times  # i am departing
      airport.departed(self.object_id)
    else
      "The plane can not take off when it is not on the airport"
    end
  end

end
