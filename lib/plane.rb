class Plane
  def take_off
    raise "Cannot take off: Plane already in air"
  end

  def airport
    raise "Plane not at airport: Plane already in air" 
  end
end
