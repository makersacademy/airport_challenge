class Airport

  def land(plane)
    plane::status = "landed"
  end

  def take_off (plane)
    plane::status = "flying"
  end

end
