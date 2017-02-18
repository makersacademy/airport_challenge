require_relative 'plane'

class Airport

attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport is full" if airport_full?
    @planes << plane
  end

  def take_off
    raise "Airport is empty" if airport_empty?
    @planes.pop
  end

private
  def airport_full?
    @planes.count >= 20
  end

  def airport_empty?
    @planes.empty?
  end

end
