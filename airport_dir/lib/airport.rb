require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @airport_hanger = []
    @capacity = capacity
  end

  def airport_hanger
    @airport_hanger
  end

  def capacity
    @capacity
  end

end
