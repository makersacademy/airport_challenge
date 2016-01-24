
class Plane


  def to_land_at(airport)
    (1..1000).times # i am landing
    airport.landed_at(self.object_id)
  end

  def take_off(airport)
    (1..1000).times # i am departing
    airport.departed(self.object_id)
  end

end
