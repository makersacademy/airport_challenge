require_relative 'plane'

class Airport
  def initialize
    @planes = []
  end

  attr_reader :plane

  def landing_plane
  end

  def airport_capacity(plane) #dockbike
    fail 'Airport is full' if full?
    @planes << plane
  end

  def land(plane)
    fail 'Stormy weather, do not land!' unless @plane
    @plane = plane
  end

  def take_off(plane) #releasebike
    fail 'Stormy weather, do not take off!' if empty?
    @planes.pop
  end

  private

  def full?
    @planes.count >= 20
  end

  def empty?
    @planes.empty?
  end
end
