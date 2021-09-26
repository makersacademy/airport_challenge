class PlaneNotFlyingError < StandardError

  DEFAULT_MESSAGE = 'Plane is not flying, it cannot land'.freeze
  
  def initialize(plane, message = DEFAULT_MESSAGE)
    @plane = plane
    super(message)
  end

  def effected_plane
    @plane
  end
end
