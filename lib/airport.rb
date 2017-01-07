require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :plane, :stormy

  def initialize(weather = Weather.new.stormy)
    @stormy = weather
    @plane = plane
  end

  def landed(plane)
    if @stormy == true
      fail "Unable to land due to stormy weather"
    else
    @plane = plane
    end
  end

  def departure
    if @stormy == true
      fail "Unable to depart due to stormy weather"
    else
      @plane
    end
  end

  #def stormy

  #  @stormy = true

  #end

end
