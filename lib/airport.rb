require_relative './plane.rb'
class AirportController #RZECZOWNIK

  attr_reader :planes

  def initialize #TWORZY SAMOLOTY
    @planes = []
  end

  def land(plane) #CZYNNOSCI
    @planes << plane
  end

  def take_off(plane) #CZYNNOSCI
    @planes.delete(plane)
    return @planes
  end
end
