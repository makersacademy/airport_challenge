class Airport

  def land(plane)
    "Plane ID #{plane} has landed."
  end

  def take_off(plane)
    raise "Can not take off during stormy weather." if @stormy
    "Plane ID #{plane} has taken off."
  end

  def stormy
    @stormy = true
  end

end