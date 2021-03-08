class Airport
  attr_reader :capacity, :weather

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    raise "Airport full" unless @planes.length <= DEFAULT_CAPACITY

    raise "Plane is at another airport" if plane.grounded

    plane.airborne = false
    @planes << plane
  end

  def take_off(plane)
    raise "Plane is already in the air" if plane.flying
    raise "Planes cannot fly when stormy" if @weather.report == "stormy"

    plane.airborne = true
    @planes.delete(plane)
    plane
  end
end

class Plane
  attr_accessor :airborne, :airport_id

  def initialize(airborne = true)
    @airborne = airborne
    # @airport_id = airport_id

  end

  def flying
    @airborne == true
  end

  def grounded
    @airborne == false
  end
end

class Weather
  attr_reader :report
  def initialize(report = self.forecast)
    @report = report
  end
  def forecast
    number = rand(1..10)
    if number.odd?
      "stormy"
    else
      "sunny"
    end
  end
end
