class Plane
  def initialize
    @flying = true
  end

  def take_off
    raise 'Plane cannot take off: plane already flying' if flying
  end

  def land(plane)
    raise 'Plane cannot land: plane already landed' if landed
    @flying = false
    @plane = plane
  end

  def airport
    raise 'Plane cannot be at an airport: plane already flying' if flying
    @airport
  end

  private

  attr_reader :flying

  def landed
    !flying
  end
end
