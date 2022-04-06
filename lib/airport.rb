require 'weather_reporter'

class Airport
 
  def initialize(capacity, weather_reporter)
    @capacity = capacity
    @weather_reporter = weather_reporter
    @planes = []
    
  end

  def land(plane)
   raise 'Unable to land plane: no empty spaces.' if full?
   raise 'Unable to land plane: stormy weather.' if stormy?
   @planes << plane
  end

  def take_off(plane)
    puts 'MA DEC21 LEFT!'
    raise 'Unable to allow planes to take off: stormy weather.' if stormy?
    raise 'Cannot take off: plane is not at this airport' unless at_airport?(plane)
  end

  private 

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather_reporter.stormy?
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end



end