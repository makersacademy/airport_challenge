require "./lib/weather.rb"

class Airport

DEFAULT_CAPACITY = 10

attr_reader :planes, :weather, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)

    @planes = []
    @capacity = capacity

  end

  def land plane
    if stormy?
    raise "no landing possible because of weather conditions"
    elsif full?
    raise "airport is full"
    else
    planes << plane
    "plane has landed"
    end
  end

  def take_off plane
    if stormy?
    raise "no take off possible because of weather conditions"
    else
    planes.pop
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
