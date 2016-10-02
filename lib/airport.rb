require 'plane'
require 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    fail 'Weather too stormy for landing' if @weather.stormy
    fail 'Airport full, plane cannot land' if full?
    @planes << plane
  end

  def take_off(plane)
    fail 'Weather too stormy for take off' if @weather.stormy
    @planes.delete(plane)
  end

  def planes
    @planes
  end

    private

    def full?
      @planes.count >= DEFAULT_CAPACITY
    end

end
