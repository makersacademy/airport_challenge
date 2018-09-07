require_relative './plane'
require_relative './weather'
class Airport
  attr_accessor :planes
  attr_reader :weather
  def initialize
    # @plane = Plane.new
    @weather = Weather.new
    @planes = []
  end

  def land(plane)
    @planes.push(plane)
  end

  def take_off(plane)
     if @weather.condition == 'sunny'
       @planes.delete(plane)
     elsif @weather.condition == 'stromy'
       "Sorry! Plane can not take due to bad weather condition"
     end
  end
end
