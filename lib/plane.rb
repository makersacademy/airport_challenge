class Plane
  attr_reader :airport, :status

  def initialize(airport = nil)
    @status = :flying
    land(airport) if airport
  end

  def land(airport)
    return if @status == :landed

    airport.land_plane(self.class)
    @airport = airport
    @status = :landed
  end

  def takeoff
    return if @status == :flying

    @airport.takeoff_plane
    @status = :flying
  end
end
