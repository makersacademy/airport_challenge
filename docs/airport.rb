require './docs/weather'

class Airport 
  
  attr_accessor :planes, :capacity

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
    @weather_report = Weather.new 
  end

  def dock(plane)
    raise "Unable to land as Airport is full." if full?
    raise "Weather too stormy to land." if stormy?
    
    @planes << plane
  end 

  def undock(plane)
    raise "Weather too stormy to take off." if stormy?
    @planes.delete(plane)
  end 

  private

  def full?
    @planes.length >= @capacity
  end 

  def stormy?
    @weather_report.weather_check == "stormy"
  end 
end 