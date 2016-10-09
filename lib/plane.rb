require_relative './airport'

class Plane
  attr_accessor :flying

  def initialize
    @flying = true
  end

  def land
     raise "Plane has already landed" if flying == false
     @flying = false
     "Plane lands"
  end

  def take_off
    raise "Plane is not in the airport" if flying == true
    @flying = true
    "Plane takes off"
  end

end
