class Airport
  attr_reader :hangar
  @hanger = []

  def land_plane(plane)
    @hanger.push(plane)
  end

  def take_off(plane)
    @hangar.delete(plane)
  end

end