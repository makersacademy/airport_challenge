class Plane

  def initialize(airport = nil)
    @airport = airport
  end

  def fly
    @airport = nil
  end

  def land_at(airport)
    @airport = airport
  end

  def in_airport?(airport)
    @airport == airport
  end

end
