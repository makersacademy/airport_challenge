require_relative 'airport'

class Aeroplane
  DEFAULT_STATE = 'flying'
  attr_reader :status

  def initialize(state = DEFAULT_STATE)
    @status = state
  end
end
