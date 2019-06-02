require_relative './plane.rb'
require_relative './weather.rb'


class AirportController #RZECZOWNIK

  attr_reader :planes

  def initialize #TWORZY SAMOLOTY
    @planes = []
  end

  def land(plane) #CZYNNOSCI

    @planes << plane
  end

  def take_off(plane) #CZYNNOSCI
    puts "Can't take off - weather is stormy" if @weather == "stormy"
    @planes.delete(plane)
    return @planes
  end

  def weather
    @weather
  end

end
