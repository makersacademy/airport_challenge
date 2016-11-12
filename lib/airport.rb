require './lib/weather.rb'
class Airport
  attr_reader :planes, :weather, :number, :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def land(aircraft, weather)
    unless stormy?(weather) || full?
      @planes << aircraft
    end
  end

  def take_off(weather)
    puts @weather
    unless stormy?(weather)
      @planes.pop
    end
  end

  def stormy?(weather)
    weather
  end

  def full?
    @planes.count >= @capacity
  end

end
