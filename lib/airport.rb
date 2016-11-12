require './lib/weather.rb'
class Airport
  attr_reader :planes, :weather, :number

  def initialize
    @planes = []
  end

  def land(aircraft)
    @planes << aircraft
  end

  def take_off
    puts @weather
    unless stormy?(weather)
      @planes.pop
    end
  end

  def stormy?(weather)
    weather
  end




end
