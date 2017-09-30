require 'weather'

class Airport

  attr_reader :planes

  PLANE_CAPACITY = 20

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport full" if @planes.length >= PLANE_CAPACITY
    @planes << plane
  end

  def stormy?
    Weather.new.stormy?
  end

  def take_off(plane)
    raise "Cannot take-off during a storm" if stormy?
    departed_plane = @planes.pop
    puts "Plane has departed" if departed? departed_plane
  end

  def departed?(plane)
    !@planes.include?(plane)
  end

end
