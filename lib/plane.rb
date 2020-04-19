class Plane

  def initialize
    @flying = true
  end

  def take_off
    raise "Cannot take off: Plane is already flying" if flying
  end

  def land(airport)
    raise "Plane cannot land: Plane already landed" if landed
    @flying = false
    @airport = airport
  end

  def airport
    raise "Plane cannot be at an airport: Plane already flying" if flying
    @airport
  end

  private

  attr_reader :flying

  def landed
    !flying
  end

end