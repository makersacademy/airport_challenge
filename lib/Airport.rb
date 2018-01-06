class Airport
  attr_reader :airport

  def land(plane)
    @airport = plane
  end

  def take_off(plane)
    @airport = nil
    take_off_confirmation(plane)
  end

private
  def take_off_confirmation(plane)
    "#{plane} no longer in airport."
  end

end
