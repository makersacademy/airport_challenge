# this class takes care of the plane handling.
#Landing and takeoff.
require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :planes
  attr_accessor :stormy_weather
  attr_reader :capacity
  attr_reader :flight_log

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @flight_log = []
    @capacity = capacity
    @stormy_weather = false #it's sunny
  end

  def actual_weather(weather)
    @stormy_weather = weather.storm #weather might change to stormy
  end

  def take_off
    fail('No take off due to storm') if @stormy_weather
      @planes.pop
  end

  def land(plane)
    fail('Airport is full') if full?
    fail('No landing due to storm') if @stormy_weather
    @flight_log << plane.plane_id
    @planes << plane
  end

  private

    def full?
      @planes.size >= @capacity ? true : false
    end

end
