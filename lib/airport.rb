require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :planes
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new.weather
    @capacity = capacity
  end

  def weather_report
    print "Today's weather is #{@weather}"
  end

  def full?
    true if planes.length >= @capacity
  end

end
