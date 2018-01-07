class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def airstrip_land(plane)
    fail "No planes will land because the weather is stormy" if stormy?
    @hangar << plane
  end

  def airstrip_take_off(plane)
    fail "No planes will take off because of the stormy weather" if stormy?
    @hangar.delete(plane)
  end

  def stormy?
    weather == "stormy"
  end

  private

  def weather
    random_weather = rand(10)
    random_weather == 9 ? "stormy" : "sunny"
  end

end
