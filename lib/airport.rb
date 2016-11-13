require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :weather, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def get_plane
    Plane.new
  end

  def set_weather(weather)
    self.weather=(weather)
  end

  def land(plane)
    fail 'Planes cannot land while it is stormy' if stormy?
    fail 'Planes cannot land at this airport, it is full' if full?
    fail 'That plane cannot land. It has already landed.' if plane.flying? == false
    @planes << plane
  end

  def take_off(plane)
    fail 'Planes cannot take off while it is stormy' if stormy?
    fail 'This plane can\'t take off from here. It hasn\'t landed here.' if !@planes.include?(plane)
    @planes.delete(plane)
  end

  def is_full?
    full?
  end

  def is_stormy?
    stormy?
  end

  private
  def weather=(weather)
    @weather = weather
  end

    def full?
      @planes.count >= DEFAULT_CAPACITY
    end

    def stormy?
      weather.condition == :stormy
    end

end
