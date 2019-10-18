require "./lib/plane"

class Airport
  attr_accessor :runway
  attr_accessor :weather

  def initialize
    @runway = []
  end

  def land_plane(plane, weather)
    weather = rand[1..20]
    if weather == 1
      "stormy"
    else
      "sunny"
    end
    raise "Planes cannot land in stormy weather" if @weather == "stormy"

    @runway << plane
  end

  def allow_take_off
    @runway.pop
  end

  # Removed while checking alternatives
  # def weather_conditions
  #   # @weather = Kernel.rand[1..20]
  #   # if @weather == 1
  #   #   "stormy"
  #   # else
  #   #   "sunny"
  #   # end
  # end
end
