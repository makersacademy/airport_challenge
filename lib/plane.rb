class Plane
  attr_reader :flying
  def initialize(flying = true)
    @flying = flying
  end
  def land
    raise "The plane has already landed!" if @flying == false
    @flying = false
  end
  def take_off
    raise "The plane is already flying!" if @flying == true
    @flying = true
  end

end
