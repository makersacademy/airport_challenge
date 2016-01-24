
class Plane
  attr_reader :where_abouts
  def initialize(airport)
    @where_abouts = airport
  end

  def to_land_at(airport)
    if airport.planes.include? self.object_id
      "The plane can not land on an airport it is already in"
    elsif @destination != airport
      "This is the wrong airport, I am heading for #{destination}"
    else
      1000.times # i am landing}
      airport.landed_at(self.object_id)
      @where_abouts = airport
    end
  end

  def take_off(airport)
    if airport.planes.include? self.object_id
      1000.times  # i am departing
      airport.departed(self.object_id)
      @destination = airport
      @where_abouts = "flying"
    else
      "The plane can not take off when it is not on the airport"
    end
  end

end
