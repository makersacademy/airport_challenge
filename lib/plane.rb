class Plane

  def initialize
    @flying = false
  end

  def land
    @flying = false
  end

  def take_off
    @flying = true
  end

  def status
    @flying ? "Flying" : "In Airport"
  end

end
