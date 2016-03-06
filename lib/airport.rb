require_relative 'airplane'
require_relative 'weather'

class Airport

  DEFAULT_VALUE = 10
  attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_VALUE)
    @planes = []
    @capacity = capacity
  end

  def full?
    @planes.size >= @capacity
  end

  def stormy?(weather=Weather.new)
    weather.stormy
  end

end
