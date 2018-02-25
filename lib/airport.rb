require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :planes
  attr_reader :weather_forcaster

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather_forcaster = Weather.new
  end

  def land(plane)
    if full?
      raise "Sorry, the airport is full"
    else
      if @weather_forcaster.stormy?
        raise "Sorry, it's too stormy to land"
      else
        @planes << plane
      end
    end
  end

  def takeoff(plane)
    if @weather_forcaster.stormy?
      raise "Sorry, it's too stormy to take off"
    else
      @planes.pop
      @planes
    end
  end

  private
  def full?
    @planes.length >= @capacity
  end

end
