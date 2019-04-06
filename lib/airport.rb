require_relative 'plane'

class Airport
  def land(plane)
    raise "Planes can't land in stormy weather" if stormy?
    raise "The airport is full" if full?

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

  def full?
    true if @plane
  end

end
