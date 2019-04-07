require 'weather'

class Airport
  attr_reader :hanger
  def initialize
    @hanger = []
  end

  def take_off(plane, forecast)
    if forecast == "stormy"
      "Takeoff prevented due to stormy weather"
    else
      @hanger -= [plane]
    end
  end
end
