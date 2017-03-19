require_relative 'plane'
require_relative 'weather'

class Airport


  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane, weather = Weather.new)
    raise 'Airport is full' if full?
    raise 'Weather warning' if weather.stormy?
    plane.descend
    @planes << plane
  end

  def launch(weather = Weather.new)
    raise 'Airport empty' if @planes.empty?
    raise 'Weather warning' if weather.stormy?
    @planes[-1].ascend
    @planes.pop
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= @capacity
  end

end
