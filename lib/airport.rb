# this class takes care of the plane handling.
#Landing and takeoff.
require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :planes
  attr_accessor :stormy_weather
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @stormy_weather = false #it's sunny
  end

  def actual_weather(weather)
    @stormy_weather = weather.storm #weather might change to stormy
  end

  def take_off
    if @stormy_weather == false #if sunny
      @planes.pop
    else
     'No take off due to storm'
    end
  end

  def land(plane)
    fail('Airport is full') if full?
      if @stormy_weather == false
        @planes << plane
      else
        'No landing due to storm'
      end
  end

  private

    def full?
      @planes.size >= @capacity ? true : false
    end

end
