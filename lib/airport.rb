class Airport

  attr_reader :landed_planes, :capacity, :weather
  attr_writer :landed_planes

  DEFAULT_CAPACITY = 30

  def  initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
    @weather = Weather.new
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
