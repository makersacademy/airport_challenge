require './lib/plane'
require './lib/weather'

class Airport
  attr_reader :plane
  attr_reader :capacity
  attr_reader :weather

  def initialize(capacity = 1)
    @capacity = capacity
    @weather = Weather.new.generate
  end

  def land_plane(plane)
    raise "Permission not granted. The airport is full." unless @plane.nil?
    @plane = plane
  end

  def take_off(plane)
    plane
  end
end
