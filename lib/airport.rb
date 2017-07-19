require './lib/plane'
require './lib/weather'

class Airport
attr_reader :planes, :capacity
  def initialize(capacity, planes = [])
    @planes = planes
    @capacity = capacity
  end

  def full?
    @planes.length >= @capacity
  end

  def storm?
    Weather.new.storm
  end
end
