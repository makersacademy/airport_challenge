require_relative 'plane'

class Airport

 attr_accessor :planes

  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

end
