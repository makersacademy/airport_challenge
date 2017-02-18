class Airport
  attr_reader :plane

  def instruct_to_land(plane)
    @plane = plane
  end

  def landed?(plane)
    @plane = plane
  end
end
