module AirTrafficControl
  private
  
  def capacity_guard
    raise CapacityError if full?
  end

  def airport_guard(plane)
    raise AirportError if gone?(plane)
  end
end
