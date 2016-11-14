class Plane

  attr_reader :flying

  def initialize(flying = true)
    @flying = flying
  end

  def land
    raise "Plane has already landed" if @flying == false
    @flying = false
  end

  def take_off
    raise "Plane is already flying" if @flying == true
    @flying = true
  end

end
