require 'weather'

class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport full" if @planes.length >= @capacity
    @planes << plane
  end

  def stormy?
    Weather.new.stormy?
  end

  def take_off(plane)
    raise "Plane not in airport" if !@planes.include? plane
    raise "Cannot take-off during a storm" if stormy?
    departed_plane = @planes.pop
    puts "Plane has departed" if departed? departed_plane
  end

  def departed?(plane)
    !@planes.include?(plane)
  end

end
