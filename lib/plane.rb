class Plane
  attr_reader :airport

  def initialize
    @airport = nil
    @flying = true
  end

  def land(airport)
    raise "already landed" unless @flying

    @airport = airport
    @flying = false
  end

  def take_off(airport)
    raise "already flying" if @flying
    raise "plane not at airport" if @airport != airport

    @airport = nil
    @flying = true
  end

end
