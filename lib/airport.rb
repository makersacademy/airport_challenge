require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader = :plane, :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather)
    @capacity = capacity
    @weather = weather
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
    puts "#{@plane} has taken off"
  end


  private

  def at_airport?(plane)
    @planes.include?(plane)
  end  

  def stormy?
    @weather.stormy?
  end
  
  def full?
    @planes.length >= @capacity
  end
end