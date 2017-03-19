require_relative 'weather'

class Airport

attr_reader :plane, :weather

  def initialize
    @all_planes = []
    @weather
  end

  def land(plane)
    @all_planes << plane
  end

  def take_off
    fail 'Stormy weather' if :stormy?
    @all_planes.pop
    self
  end

end
