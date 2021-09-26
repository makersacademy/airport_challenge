require 'weather' # rspec doesn't like this being called ./weather, but the IDE does
require 'system_designer' # rspec doesn't like this being called ./system_designer, but the IDE does
require 'outputs'

class AirTrafficControl
  def initialize(capacity)
    designer = SystemDesigner.new
    weather = Weather.new

    @planes_amount = 0
    @airport_capacity = designer.default_capacity(capacity) # sets the capacity of the airport
    weather.random_weather # returns the weather-type for that day as a string (stormy or sunny)
  end

  def prevent_flights?
    if @weather.eql? "stormy"
      true
    end
  end

  def land_at_airport
    if prevent_flights?.eql? false
      true
      @planes_amount += 1
    else
      "Cannot land due to storm"
    end

  end

  def take_off
    if prevent_flights?.eql? false
      true
      @planes_amount -= 1
    else
      "Cannot take-off due to storm"
    end

  end

  def airport_full?
    if @planes_amount > @airport_capacity
      true
    end
  end

  def airport_capacity
    @airport_capacity
  end

  def planes_amount
    @planes_amount
  end

  def update_planes_amount(planes)
    @planes_amount = planes
  end

end

outputs = Outputs.new
outputs.output
