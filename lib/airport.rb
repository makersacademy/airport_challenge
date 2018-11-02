
class Airport
  attr_accessor :planes, :weather
  attr_reader :capacity
  
  def initialize(capacity = 20)
    @capacity = capacity
    @planes = []
    @weather = true
  end

  def can_land?
    @weather && !is_full?
  end

  def is_full?
    @planes.length >= @capacity
  end

  def weather_ok?
  end
  
  

end
