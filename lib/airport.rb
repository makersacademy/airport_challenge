class Airport

  attr_reader :landed_planes, :capacity, :weather, :landed_planes_history
  attr_writer :landed_planes

  DEFAULT_CAPACITY = 30

  def  initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @landed_planes_history = []
    @capacity = capacity
    @weather = Weather.new
  end

  def confirm_plane_landed(plane)
    fail 'That plane has never been at this airport.' if !plane_landed_at_airport?(plane)
    plane_at_airport?(plane)
  end

  def confirm_plane_taken_off(plane)
    fail 'That plane has never been at this airport.' if !plane_landed_at_airport?(plane)
    !plane_at_airport?(plane)
  end

  private

  def plane_at_airport?(plane)
    @landed_planes.include?(plane)
  end

  def plane_landed_at_airport?(plane)
    @landed_planes_history.include?(plane)
  end

end
