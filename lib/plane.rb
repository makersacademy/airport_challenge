class Plane
  def take_off
    raise "Cannot take off: Plane is already flying"
  end
  def airport
    raise "Plane cannot be at an airport: Plane already flying"
  end
end