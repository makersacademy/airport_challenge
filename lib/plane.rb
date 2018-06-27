class Plane

  def initialize
    @flying = true
  end

  def takeoff
    raise 'Plane cannot take off, the plane is already flying' if flying
  end

  def land(airport)
    raise 'Plane cannot land, the plane is already landed' if landed
    @flying = false
    @airport = airport
  end

  def airport
    raise 'Plane cannot be at an airport, the plane is already flying' if flying
    @airport
  end

  private

  attr_reader :flying

  def landed
    !flying
  end
end
