class Airport

  def land(_plane)
    fail "Cannot land: weather is stormy" if stormy?

    "landed"
  end

  def take_off(_plane)
    fail "Cannot takeoff: weather is stormy" if stormy?

    "taken off"
  end

  def stormy?
    true
  end
end
