class AirportFullError < StandardError

  DEFAULT_MESSAGE = 'This airport is full you cannot land any more planes'.freeze

  def initialize(message = DEFAULT_MESSAGE)
    super(message)
  end

end
