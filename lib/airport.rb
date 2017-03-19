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
    raise 'This plane has already landed' if !plane.flying?
    plane.descend
    @planes << plane
  end

  def launch(plane, weather = Weather.new)
    raise 'Airport empty' if @planes.empty?
    raise 'Weather warning' if weather.stormy?
    raise 'That plane is not here' if !@planes.include?(plane)
    @planes.delete(plane)
    plane.ascend
    plane
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= @capacity
  end

end
