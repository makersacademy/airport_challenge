require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :planes
  attr_reader :weather_forcaster

  def initialize
    @planes = []
    @weather_forcaster = Weather.new
  end

  def land(plane)
    if full?
      raise "Sorry, the airport is full"
    else
      if @weather_forcaster.stormy?
        raise "Sorry, it's too stormy to land"
        @planes
      else
        @planes << plane
      end
    end
  end

  def takeoff(plane)
    if @weather_forcaster.stormy?
      raise "Sorry, it's too stormy to take off"
      @planes
    else
      @planes.pop
      @planes
    end
  end

  private
  def full?
    @planes.empty?
  end

end
