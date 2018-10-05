class Airport
  def land(plane)
    @hanger = plane
  end

  def take_off(plane)
    @hanger
  end

  def in_hanger?(plane)
    @hanger == plane
  end
end
