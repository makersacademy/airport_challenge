require "./lib/weather.rb"
require "./lib/plane.rb"

class Airport

DEFAULT_CAPACITY = 10

attr_reader :planes, :weather, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)

    @planes = []
    @capacity = capacity

  end

  def land plane
    if plane.status == "landed"
      raise "plane has already landed"
    elsif  stormy?
    raise "no landing possible due to weather conditions"
    elsif full?
    raise "airport is full"
    else
    planes << plane
    plane.status = "landed"
    "plane has landed"
    end
  end

  def take_off plane
    if !planes.include?(plane)
      raise "plane is not at this airport"
    end
    if stormy?
    raise "no take off possible due to weather conditions"
    else
    planes.pop
    plane.status = "airborne"
    "plane has taken off"
    end
  end

  def full?
    planes.count == capacity - 1
  end

  def stormy?
    Weather.new.forecast == "stormy"
  end
end
