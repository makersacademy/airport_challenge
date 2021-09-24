class PlaneAlreadyLandedError < StandardError

  DEFAULT_MESSAGE = 'This plane has already landed!'.freeze

  def initialize(plane, message = DEFAULT_MESSAGE)
    @plane = plane
    super(message)
  end

  def effected_plane
    @plane
  end
end