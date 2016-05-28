class Plane

  def initialize(location = :airborne)
    @location = location
  end

  def land
    @location = :airport
  end

  def take_off
    @location = :airborne
  end

  def landed?
    @location == :airport
  end

end
