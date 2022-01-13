require_relative 'weather_reporter'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather_reporter)
    @capacity = capacity
    @weather_reporter = weather_reporter
    @planes = []


  end


  def land(plane)
    
    raise 'airport full' if full?
    raise 'weather is stormy' if stormy?

    @planes << plane
  end


  def take_off(plane)
    raise 'weather is stormy' if stormy?
    
    raise 'plane not at this airport' unless at_airport?(plane)
  end


  private

  def at_airport?(plane)
    @planes.include?(plane)
  end  

  def stormy?
    @weather_reporter.stormy?
  end
  
  def full?
    @planes.length >= @capacity
  end
end