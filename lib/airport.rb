class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def airstrip_land(plane)
    @hangar << plane
  end

  def airstrip_take_off(plane)
    fail "No planes will take off because of the stormy weather" if weather == "stormy"
    @hangar.delete(plane) 
  end

  def weather
    random_weather = rand(10)
    random_weather == 9 ? "stormy" : "sunny"
  end
end
