require_relative './plane'

class Airport
  @@weather_possibilities = ["sunny", "sunny", "stormy", "sunny"]

  attr_accessor :weather
  def initialize(plane_capacity = 50)
    @weather = nil
    @plane_capacity = plane_capacity
    @planes_at_airport = []
  end

  def land(plane)
    @weather = @@weather_possibilities.sample
    if @planes_at_airport.count < @plane_capacity && weather != "stormy"
      plane.flying = !plane.flying
      @planes_at_airport.push(plane)
    elsif weather == "stormy"
      raise "The weather is stormy. It's too dangerous to land"
    else
      raise "Airport is full"
    end
  end

  def take_off(plane)
    @weather = @@weather_possibilities.sample
    if weather != "stormy" and !plane.flying
      plane.flying = !plane.flying
      @planes_at_airport.delete(plane)
    else
      raise "The weather is stormy. It's too dangerous to take off"
    end
  end
end