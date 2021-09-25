class PlaneNotFlyingError < StandardError

  DEFAULT_MESSAGE = 'Plane is not flying'.freeze
  
  def initialize(plane, message = DEFAULT_MESSAGE)
    @plane = plane
    super(message)
  end

  def effected_plane
    @plane
  end
end
