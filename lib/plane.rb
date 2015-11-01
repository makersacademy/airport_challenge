class Plane

  def initialize
    @flying = true
  end

  def take_off
    raise 'Plane cannot take off: plane already flying' if @flying
  end

  def land(airport)
    raise 'Plane cannot land: plane alredy landed' unless @flying
    @airport = airport
    @flying = false
  end

  def airport
    raise 'Plane cannot be at an aiport: plane already flying' if @flying
    @airport
  end

end
