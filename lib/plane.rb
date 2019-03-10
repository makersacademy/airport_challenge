class Plane
  attr_accessor :airport, :status

  def land_at(airport)
    @airport = airport
    @status = :landed
    "Landed at airport #{airport.name}"
  end

  def takeoff
    @airport = nil
    @status = :flying
    "Plane is flying"
  end

end
