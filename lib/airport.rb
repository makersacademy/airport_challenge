class Airport

  require_relative 'plane'

  def initialize
    @planes = []
  end

  def land(plane)
    raise 'Airport full' if airport_full?
    @planes << plane
    plane.landed
  end

  def take_off
    raise 'All planes have taken off' if airport_empty?
    @planes.pop
  end

  private

  def airport_full?
    @planes.length == 1
  end

  def airport_empty?
    @planes.empty?
  end

end