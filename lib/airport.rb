class Airport

  attr_reader :landed_planes
  attr_writer :landed_planes

  def  initialize
    @landed_planes = []
  end

  def confirm_plane_landed(plane)
    plane_at_airport?(plane)
  end

  def confirm_plane_taken_off(plane)
    !plane_at_airport?(plane)
  end

  private

  def plane_at_airport?(plane)
    @landed_planes.include?(plane)
  end
end
