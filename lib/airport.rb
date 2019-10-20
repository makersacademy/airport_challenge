class Airport
  attr_reader :planes_on_groud


  def land(plane)
    raise "cannot land the plane: weather is stormy!" if stormy?
    @planes_on_groud = plane
  end

  def take_off(plane)
    raise "cannot take off: weather is stormy!" if stormy?
    @planes_on_groud
  end

  def stormy?
    rand(1..6) > 4
  end

end
