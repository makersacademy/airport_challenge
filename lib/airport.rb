

class Airport
  attr_reader :airport_gates, :capacity

  def initialize(capacity = 20)
    @airport_gates = []
    @capacity = capacity
  end
  
  def generate_planes
    @capacity.times {@airport_gates.push(Plane.new)}
    reg_no = 1
    index = 0
    while reg_no <= @capacity
      @airport_gates[index] = "Plane#{reg_no}"
      reg_no += 1
      index += 1
    end
  end

  def land_plane
    @airport_gates.push
  end

  def plane_take_off
    @airport_gates.shift

  end
end
