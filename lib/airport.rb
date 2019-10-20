class Airport

  def land(plane)
  end

  def take_off(_plane)
    fail "Cannot takeoff: weather is stormy" if stormy?

    "taken off"
  end

  def stormy?
    true
  end
end
