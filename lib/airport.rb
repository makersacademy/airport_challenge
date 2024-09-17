require "weather"

class Airport
  attr_reader :planes, :name

  def initialize(name = "Heathrow")
    @weather = Weather.new
    @planes = []
    @name = name
  end

  def open_for_landing?
    @weather.weather_status == "Sunny"
  end

  def land(plane)
    raise "Stormy, can't land planes" unless open_for_landing?

    raise "Can't land, already at the airport" if plane.airport == @name

    plane.land(@name)
    @planes << plane
  end

  def takeoff(plane)
    raise "Stormy, can't take off planes" unless open_for_landing?

    raise "Plane not at airport" unless planes.include?(plane)

    plane.takeoff
    planes.reject! { |x| x == plane }

  end

end
