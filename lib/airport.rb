require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 8
  attr_reader :planes, :weather, :capacity

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land plane
    raise StandardError, 'Airport is full' unless !full?
    raise StandardError,'Weather is stormy' if @weather.stormy?
    @planes << plane
  end

  def take_off plane
    raise StandardError,'Weather is stormy' if @weather.stormy?
    raise StandardError,'The plane is not in this airport' unless @planes.include?(plane)
    @planes.pop
  end

  private

  def full?
    @planes.length == @capacity
  end
end
