require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :plane, :stormy

  def initialize(weather = Weather.new)
    @plane = plane
    @stormy = weather
  end

  def landed(plane)
    if @stormy == false
      @plane = plane
    else
      fail "Unable to land due to stormy weather"
    end
  end

  def departure
    if @stormy == false
      @plane
    else
      fail "Unable to depart due to stormy weather"
    end
  end

  #def stormy

    #@stormy = true
     #stormy = rand(1..30) == 1 ? true : false
     #return @stormy
  #end

end
