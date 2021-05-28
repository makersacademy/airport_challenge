class Airport
  attr_reader :hangar

  def land(plane)
    @hangar = plane
  end

end
