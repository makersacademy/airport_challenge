require_relative "plane"
require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 1
  attr_reader :hangar
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise "Too stormy to land!" if weather_bad?
    raise "Error: airport is full" if airport_full?
    if @hangar.length < @capacity
      raise "Plane already in airport" if plane_present?(plane)
    end
    @hangar << plane
  end

  def takeoff(plane)
    raise "Too stormy to take off!" if weather_bad?
    raise "Error: plane is not at the airport" unless plane_present?(plane)
    @hangar.delete(plane)
    "#{plane} has taken off"
  end

  private
  def plane_present?(plane)
    @hangar.include?(plane)
  end

  def weather_bad?
    Weather.new.report == "stormy"
  end

  def airport_full?
    @hangar.length == @capacity
  end

end
