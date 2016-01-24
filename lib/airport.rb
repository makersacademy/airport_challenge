require_relative 'weather'

class Airport
  include Weather

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @ground_planes = []
    @capacity = capacity
  end

  def full?
    true if @ground_planes >= @capacity
    false
  end

end
