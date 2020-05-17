class Plane
  def take_off
    raise 'Plane cannot take off: plane already flying'
  end

  def airport
    raise 'Plane cannot be at an airport: plane already flying'
  end

end
