class Plane
  attr_accessor :airporr, :status

  def land_at(airport)
    @airport = airport
    @status = :landed
    "Landed at airport #{airport.name}"
  end

end
