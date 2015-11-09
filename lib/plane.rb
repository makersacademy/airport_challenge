class Plane

  def initialize
    @flying = true
    @airport = nil
  end

  def take_off
    raise 'Plane cannot take off: plane already flying' if flying
    @flying = true
  end

  def land(airport)
    raise 'Plane cannot land: plane already landed' if landed
    @airport = airport
    @flying = false
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
