class Plane
  attr_accessor :landed

  def landing(landed)
    raise "Cannot land! Plane is already grounded" if landed
    landed = true
    "Plane has landed!"
  end

  def take_off(landed)
    raise "Cannot take off! Plane is already in the air" unless landed
    landed = false
    "Plane has sucessfully taken off!"
  end
end
