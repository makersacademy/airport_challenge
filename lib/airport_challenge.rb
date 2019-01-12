class Airport
  attr_reader :planes
  attr_reader :max_capacity

  def initialize(max_capacity = 5)
    @planes = []
    @weather = rand(1..100) < 95 ? :sunny : :stormy
    @max_capacity = max_capacity
  end

  def change_capacity(new_cap)
    @max_capacity = new_cap
  end

  def weather_report
    return @weather
  end

  def clear_skies?
    return weather_report != :stormy
  end

  def airport_contains?(plane)
    return @planes.include?(plane)
  end

  def land(plane)
    raise("Can't land during stormy weather") unless clear_skies?

    raise("Airport at full capacity!") if at_capacity?

    raise("Plane has already landed!") if airport_contains?(plane)

    @planes << plane
  end

  def takeoff(plane)
    raise("Plane not found!") unless @planes.include?(plane)

    return @planes.slice!(@planes.index(plane)) if clear_skies?

    raise("Can't take off during stormy weather")
  end

  def at_capacity?
    @planes.length >= @max_capacity
  end
end

class Plane
  attr_accessor :desig
  attr_reader :randumm

  @@instance_number = 0

  def initialize
    @@instance_number += 1
    @desig = "MA" + @@instance_number.to_s
  end
end
