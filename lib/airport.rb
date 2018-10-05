class Airport
  DEFAULT_CAPACITY = 5

  attr_accessor :capacity, :planes_in_airport

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    check_weather
    @planes_in_airport = []
  end

  def land(plane)
    raise "Unable to land due to stormy weather" if bad_weather?
    raise "Unable to land; airport is full" if full?
    raise "Unable to land; plane is already in airport" unless plane_in_airport?(plane)
    land_plane_status(plane)
    return "Plane has landed"
  end

  def takeoff(plane)
    raise "Unable to takeoff due to stormy weather" if $weather == "stormy"
    raise "Unable to takeoff; plane not in airport" unless @planes_in_airport.include?(plane)
    takeoff_plane_status(plane)
    return "Plane has taken off"
  end

  def check_weather
    chance = rand(10)
    if (0..7).include?(chance)
      $weather = "sunny"
    else
      $weather = "stormy"
    end
  end

  def full?
    @planes_in_airport.length >= @capacity
  end

  def bad_weather?
    $weather == "stormy"
  end

  def plane_in_airport?(plane)
    $planes_outside_airports.include?(plane.object_id)
  end

  def land_plane_status(plane)
    @planes_in_airport << plane
    $planes_outside_airports.delete(plane.object_id)
  end

  def takeoff_plane_status(plane)
    @planes_in_airport.delete(plane)
    $planes_outside_airports << plane.object_id
  end

end
