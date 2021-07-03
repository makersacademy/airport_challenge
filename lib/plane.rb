class Plane

  def initialize(flying = true)
    @flying = true
  end

  def take_off
    raise 'Plane already flying!' if @flying
  end

  def land
    raise 'Plane is already landed!' unless @flying
  end

end