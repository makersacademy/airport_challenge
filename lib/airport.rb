require_relative './plane'
require_relative './weather'
class Airport
  attr_accessor :planes
  attr_reader :weather
  def initialize(weather, planes)
    # @plane = Plane.new
    @weather = weather
    @planes = planes
  end

  def land(plane)
    if !@planes.include?(plane)
      @planes.push(plane)
    end
  end

  def take_off(plane)
     if @weather.condition == 'sunny'
       @planes.delete(plane)
     elsif @weather.condition == 'stormy'
       "Sorry! Plane can not take due to bad weather condition"
     end
  end
end
