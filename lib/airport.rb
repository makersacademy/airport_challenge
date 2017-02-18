require_relative 'plane'

class Airport

attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport is full" unless @planes.count < 20
    @planes << plane
  end

  def take_off
    raise "Airport is empty" if @planes.empty?
    @planes.pop
  end

end
