class PlaneNotAtAirportError < StandardError

  DEFAULT_MESSAGE = 'The plane is not at this airport,' +
                    'check the location of the plane'.freeze
  
  def initialize(plane, message = DEFAULT_MESSAGE)
    @plane = plane
    super(message)
  end

  def effected_plane
    @plane
  end
end
