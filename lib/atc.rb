class Atc
  attr_accessor :landed, :taken_off, :land, :take_off, :plane, :in_airport_method, :in_airport


  def land(plane)
    @plane = plane
    @plane.landed = true
  end

  def take_off(plane)
    @plane = plane
    @plane.in_airport = false
    @plane.taken_off = true
  end

  def landed?(plane)
    @plane = plane
    @plane.landed
  end


end
