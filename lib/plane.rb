class Plane
  def initialize
    @flying = false
  end

  def take_off
    @flying = true
  end

  def land
    raise "This plane isn't flying!" unless @flying
    @flying = false
  end

  def flying?
    @flying
  end
end