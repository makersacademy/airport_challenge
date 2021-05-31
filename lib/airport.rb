require './lib/weather_reporter.rb'

class Airport
  def initialize(capacity, weather_reporter)
    @capacity = capacity
    @weather_reporter = weather_reporter
    @planes = []
  end
  
  def land(plane)
    raise "Cannot land plane, Airport full." if full?
    raise "Cannot land plane, weather is stormy." if stormy?
    @planes << plane
  end 

  def take_off(plane)
    raise 'Cannot take off, weather is stormy.' if stormy?
  end

 private
  def stormy?
    @weather_reporter.stormy?
  end  

  def full?
    @planes.length >= @capacity
  end 
end