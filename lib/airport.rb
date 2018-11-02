require_relative 'aeroplane'

class Airport
  attr_reader :capacity
  attr_accessor :aeroplanes, :storm
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @aeroplanes = []
    @capacity = capacity
    @storm = set_weather
  end

  def land(aeroplane)
    raise "#{self.class.name} full" if full?
    @aeroplanes << aeroplane
  end

  def takeoff(aeroplane)
    raise "Too stormy" if @storm
    @aeroplanes.delete(aeroplane)
  end

  private

  def full?
    @aeroplanes.count == @capacity
  end

  def set_weather
    weather_quality = rand(10)
    weather_quality < 1 ? @storm = true : @storm = false
  end

end
