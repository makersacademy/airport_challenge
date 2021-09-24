class PlaneNotAtAirportError < StandardError

  DEFAULT_MESSAGE = 'Plane is not at this airport'.freeze
  
  def initialize(plane, message = DEFAULT_MESSAGE)
    @plane = plane
    super(message)
  end

  def effected_plane
    @plane
  end
end
