require_relative 'plane'
require_relative 'weather'

class Airport

  #responsible for storing landed planes, and enabling them to land or take-off if safe and logical

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane, weather = Weather.new)
    raise 'This plane has already landed' if !plane.flying?
    raise 'Airport is full' if full?
    raise 'Weather warning' if weather.stormy?
    plane.descend
    @planes << plane
  end

  def launch(plane, weather = Weather.new)
    raise 'Airport empty' if empty?
    raise 'That plane is not here' if !here?(plane)
    raise 'Weather warning' if weather.stormy?
    @planes.delete(plane)
    plane.ascend
    plane
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= @capacity
  end

  def here?(plane)
    @planes.include?(plane)
  end

  def empty?
    @planes.empty?
  end

end
