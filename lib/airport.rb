require './lib/plane'

class Airport
  attr_reader :capacity
  attr_reader :hangar

  def initialize(capacity = 3)
    @capacity = capacity
    @hangar = []
  end

  def land_plane(plane)
    if @hangar.include? plane then raise "Plane already in hangar." end
    raise "Permission denied. Stormy weather" unless check_weather == "sunny"
    raise "Permission not granted. The airport is full." unless @hangar.length < @capacity
    @hangar << plane
  end

  def take_off(plane)
    raise "Plane not in hangar." unless @hangar.include? plane
    raise "Permission denied. Stormy weather" unless check_weather == "sunny"
    @hangar.delete(plane)
  end
  
  def check_weather
    return "sunny" unless rand(5) == 4
    "stormy"
  end
end

london = Airport.new(5)
manchester = Airport.new