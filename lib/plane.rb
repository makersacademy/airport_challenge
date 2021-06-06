class Plane
  attr_reader :flying, :location

  def flying?(flying = false)
    @flying = flying
  end

  def current_location(location)
    @location = location
  end

end