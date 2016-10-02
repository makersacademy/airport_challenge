require_relative './plane'
require_relative './weather'


class Airport
  DEFAULT_CAPACITY = 5
   attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def conditions_good?
    (Weather.new).stormy?
  end

end
