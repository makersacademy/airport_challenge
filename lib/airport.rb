require_relative 'weather'
require_relative 'plane'

class Airport
  include Weather

DEFAULT_CAPACITY = 20
  attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "airport full, find another lol" if full?
    raise "plane already landed" if @planes.include?(plane)
    @planes << plane
  end

  def take_off
    raise "stormy day, no flying" if weather_report == "stormy"
    @planes.pop
  end

  private

  def full?
    @planes.size >= 20
  end
end
