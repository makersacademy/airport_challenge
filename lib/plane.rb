class Plane

  def landed?
    true
  end

  def land airport
    airport.landed_planes << self
  end

end
