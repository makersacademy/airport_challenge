require_relative "flying"
require_relative "plane"
require_relative "weather"

class Airport

    attr_reader :planes
    attr_reader :capacity
    attr_reader :planes_in_flight

    # DEFAULT_CAPACITY = 10

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
    @planes_in_flight = []
  end

  def plane_landed(plane_name, weather_now)
      # raise "This airport is full to capacity, please go to the next nearest airport to land" if full?
     @planes << plane_name
     "Plane #{plane_name} has landed"

  end

  def taken_off(weather_now)
    if weather_now == :sunny
      @planes_in_flight << @planes.pop
      "Plane #{@planes_in_flight.last} has taken off"
    elsif weather_now == :stormy
      "Flights are not allowed to take off due to weather condition"
    end
  end
  # def full?
  #   @planes.count == DEFAULT_CAPACITY
  # end
end
