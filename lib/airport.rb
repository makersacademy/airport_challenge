require_relative './plane'

class Airport
  @@weather_possibilities = ['sunny', 'sunny', 'sunny', 'stormy']

  attr_reader :plane_capacity, :planes_at_airport
  def initialize(plane_capacity = 50)
    @weather = nil
    @plane_capacity = plane_capacity
    @planes_at_airport = []
  end

  def land(plane)
    @weather = @@weather_possibilities.sample
    if @weather == 'stormy'
      raise "Cannot land, weather is too poor"
    elsif @planes_at_airport.count == @plane_capacity
      raise "Cannot land, airport is full"
    elsif @planes_at_airport.include?(plane) 
      raise "You can't land a plane that's already at the airport"
    else
      @planes_at_airport.push(plane)
    end
  end

  def take_off(plane)
    @weather = @@weather_possibilities.sample
    if @weather == 'stormy'
      raise "Cannot land, weather is too poor"
    end
    unless @planes_at_airport.include?(plane)
      raise "Cannot instruct a plane that isn't at the airport to take off"
    else
      @planes_at_airport.delete(plane)
    end
  end
end
