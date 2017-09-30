require 'weather'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
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
