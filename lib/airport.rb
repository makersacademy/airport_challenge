require_relative 'weather'

class Airport
  attr_reader :hangar
  attr_reader :capacity

  def initialize
    @hangar = []
    @capacity = 2
  end

  def takeoff(plane, forecast)
    if forecast == "stormy"
      "Takeoff prevented due to stormy weather"
    else
      @hangar -= [plane]
    end
  end
end
