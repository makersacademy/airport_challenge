require_relative 'plane'

class Airport
  def initialize
    @planes = [] # every new instance of airport will have a planes array that stores how many planes are currently landed
  end

  def depart
    raise "There are no planes at the airport to depart!" if empty?
    @planes.pop
    @planes
  end

  def land(plane)
    raise "Airport is full! No planes can land here." if full?
    @planes << plane
  end

  private #apparently I'm missing coverage on lines within full and empty methods, but I thought I didn't need to write unit tests for private methods?

  def full?
    @planes.length > 29
  end

  def empty?
    @planes.empty?
  end


end