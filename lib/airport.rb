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
    raise StandardError, 'Plane is not flying' if plane.flying == false
    plane.landed
    @planes << plane
  end

  def take_off plane
    raise StandardError,'Weather is stormy' if @weather.stormy?
    raise StandardError,'The plane is not in this airport' unless @planes.include?(plane)
    raise StandardError,'Plane is already flying'if plane.flying == true
    plane.fly
    find_plane(plane)
  end

  private

  def full?
    @planes.length == @capacity
  end

  def find_plane plane
    a = @planes.select{ |x| x == plane}
    a.pop
  end
end
