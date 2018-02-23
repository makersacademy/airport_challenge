

class Plane
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
end
