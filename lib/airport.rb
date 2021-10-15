class Airport

  DEFAULT_CAPACITY = 1

  def instruct_to_land(plane)
    raise "AirportFull" if full?
    @plane = plane 
  end

  def instruct_to_take_off(plane)
  end

  def plane_at_airport?(_plane)
    false
  end

  private

  def full?
    return !@plane.nil?
  end

end
