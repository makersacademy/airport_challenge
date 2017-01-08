require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :plane, :stormy

  def initialize(weather = Weather.new.stormy)
    @stormy = weather
    @plane = plane
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

  #  @stormy = true

  #end

end
