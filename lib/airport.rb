require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane = Plane.new)
    raise "Airport full" if @planes.length >= @capacity
    raise "Plane is grounded" if !plane.flying
    plane.ground
    @planes << plane
  end

  def stormy?
    Weather.new.stormy?
  end

  def take_off(plane)
    raise "Plane not in airport" if !@planes.include? plane
    raise "Cannot take-off during a storm" if stormy?
    plane.fly
    departed_plane = @planes.pop
    puts "Plane has departed" if departed? departed_plane
  end

  def departed?(plane)
    !@planes.include?(plane)
  end

end
