require_relative 'plane'

class Airport
  def land(plane)
    @plane = plane
  end

  def take_off
    raise "Planes can't take off in stormy weather" if stormy?
    @plane = nil
    "The plane has taken off"
  end

private
  def stormy?
    weather = ["stormy", "sunny"]
    random_weather = weather[rand(0..1)]
    random_weather == "stormy"
  end

end
