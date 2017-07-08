class Plane

  def initialize(location = :in_air)
    @location = location
  end

  def land(airport)
    @location = airport
  end

  def status
    location == :in_air ? "Plane is flying" : "Plane is at airport #{location.name}"
  end

  private
  attr_reader :location

end
