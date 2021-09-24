class AirportFullError < StandardError

  DEFAULT_MESSAGE = 'Airport is full'.freeze
  def initialize(plane, message = DEFAULT_MESSAGE)
    @plane = plane
    super(message)
  end

  def effected_plane
    @plane
  end
end
