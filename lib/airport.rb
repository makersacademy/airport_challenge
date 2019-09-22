require_relative 'plane'
require_relative 'weather'

class Airport
  # capacity can be changed and read by attr_accessor
  # 'plane' and 'stormy' can only be read by attr_reader
  attr_accessor :capacity
  attr_reader :planes, :stormy

  DEFAULT_CAPACITY = 10

  # let the starting capacity be 10
  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @stormy = weather.stormy?
  end

  def take_off
    fail "Airport is empty!" if empty? == true

    fail "too stormy to take off!" if @stormy == true

    @planes.pop
  end

  def land(plane)
    fail "Airport is full!" if full? == true

    fail "too stormy to land!" if @stormy == true

    @planes << plane
  end

  private

  def empty?
    @planes.empty?
  end

  def full?
    return true if @planes.size >= @capacity
  end

end
