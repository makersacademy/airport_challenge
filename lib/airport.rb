class Airport
  CAPACITY_ERROR_MESSAGE = "Plane landed on top of another plane, everyone died"
  attr_reader :name, :code, :planes, :capacity

  def initialize(weather, name, code, capacity = 5)
    @weather = weather
    @name = name
    @code = code
    @planes = []
    @capacity = capacity
  end

  def receive(plane)
    fail(RuntimeError.new(CAPACITY_ERROR_MESSAGE)) unless capacity_ok?

    @planes.push(plane)
    return true
  end

  def release(plane)
    @planes.delete(plane)
    return true
  end

  def cleared_for_takeoff?(plane)
    return :not_in_airport unless contains?(plane)
    return :weather unless weather_ok?

    return true
  end

  def cleared_for_landing?
    return :weather unless weather_ok?
    return :capacity unless capacity_ok?

    return true
  end

  def contains?(plane)
    @planes.any? { |plane_in_airport| plane_in_airport == plane }
  end

  def weather_ok?
    !@weather.stormy?
  end

  def capacity_ok?
    @planes.length < @capacity
  end
end
