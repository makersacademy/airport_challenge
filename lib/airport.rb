class Airport
  def land(plane)
    raise 'Plane cannot land because it is stormy' if :stormy?
  end

  def take_off(plane)
    raise 'Plane cannot take off because it is stormy' if :stormy?
  end

  def stormy?
    random_generator = rand(1..10)
    if random_generator > 7
      true
    else
      false
    end
  end
end
