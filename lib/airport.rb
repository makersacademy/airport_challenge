require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "The airport is full" unless planes.empty?
    planes << plane
  end

  def take_off
    raise "No planes at the airport" if planes.empty?
    planes.pop
  end

end
