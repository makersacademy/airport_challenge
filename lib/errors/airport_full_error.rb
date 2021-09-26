class AirportFullError < StandardError

  DEFAULT_MESSAGE = 'This airport is full you cannot land any more planes'.freeze

  def initialize(plane_id, message = DEFAULT_MESSAGE)
    @plane_id = plane_id
    super(message)
  end

  def effected_plane
    @plane
  end
end
