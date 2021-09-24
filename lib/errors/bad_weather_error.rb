class BadWeatherError < StandardError

  DEFAULT_MESSAGE = 'Bad weather'.freeze
  def initialize(plane, message = DEFAULT_MESSAGE)
    @plane = plane
    super(message)
  end

  def effected_plane
    @plane
  end
end
