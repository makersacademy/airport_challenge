require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :planes
  attr_reader :weather_forecaster

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather_forecaster = Weather.new
  end

  def land(plane)
    raise "Sorry, the airport is full" if full?
    raise "Sorry, the plane is landed already" if exist?(plane)
    raise "Sorry, it's too stormy to land" if @weather_forecaster.stormy?
    @planes << plane
  end

  def takeoff(plane)
    raise "Sorry, the plane is flying already" unless exist?(plane)
    raise "Sorry, it's too stormy to take off" if @weather_forecaster.stormy?
    @planes.delete(plane)
    @planes
  end

  private
  def full?
    @planes.length >= @capacity
  end

  def exist?(plane)
    @planes.include?(plane)
  end

end
