class Plane
  def initialize
    @flying = true
  end

  def takeoff
    raise 'Plane cannot takeoff: plane already flying' if flying
  end

  def land(airport)
    raise 'Plane cannot land: plane is already landed' if landed
    @flying = false
    @airport = airport
  end

  def airport
    raise 'Plane cannot be at an airport: plane is already flying' if flying
    @airport
  end

  private

  attr_reader :flying

  def landed
    !flying
  end
end
