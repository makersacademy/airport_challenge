require_relative 'Weather'

class Airport
  include Weather

  attr_reader :planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

end
