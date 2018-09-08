require_relative './plane'
require_relative './weather'
class Airport
  MAX_CAPACITY = 20

  attr_accessor :planes, :max_capacity
  attr_reader :weather

  def initialize(weather, planes, max_capacity = MAX_CAPACITY)
    # @plane = Plane.new
    @weather = weather
    @planes = planes
    @max_capacity = max_capacity
  end

  def land(plane)
    fail "Airport is full" if full?
    if !@planes.include?(plane)
      @planes.push(plane)
    end
  end

  def take_off(plane)
     if @weather.condition == 'sunny'
       @planes.delete(plane)
     elsif @weather.condition == 'stormy'
       "Sorry! Plane can not take off due to bad weather condition"
     end
  end

  private
  def full?
    @planes.length >= @max_capacity
  end
end
