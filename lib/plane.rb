class Plane
  def initialize
    @flying = true
  end

  def take_off
    raise "Cannot take off: Plane already in air" if @flying

  end

  def land(airport)
    raise "Plane cannot land: Plane already landed at airport" unless @flying
    @flying = false
    @airport = airport
  end

  def airport
    raise "Plane not at airport: Plane already in air" if @flying
    @airport
  end
end
