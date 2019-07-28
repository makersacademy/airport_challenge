class Airport

  def land_plane
    raise "Plane cannot land as weather is stormy" if stormy?
    raise "Plane cannot land as airport is full!" if full?
  end

  def take_off
    raise "Plane cannot take off as weather is stormy" if stormy?
    raise "Plane is no longer in the airport" if !stormy?
  end

  def stormy?
    rand(10) > 8
  end

  def full?
    rand(10) > 8
  end

end
