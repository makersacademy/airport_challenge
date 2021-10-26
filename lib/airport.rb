class Airport 
  attr_reader :plane
  attr_reader :capacity
  attr_reader :weather

  def initialize(planes = [], capacity = 1, weather = rand(1..10))
    @plane = planes
    @capacity = capacity
    @weather = weather
  end
 
  def land(boeing)
    fail "Weather is stormy" if (@weather > 7)

    fail "Airport at capacity" if @plane.length > (@capacity - 1)
    
    @plane << boeing
  end

  def take_off(boeing)
    fail "Weather is stormy" if (@weather > 7)
    
    fail "This plane is not at this airport" unless (@plane.include? boeing)

    @plane.delete(boeing)   
    @plane
  end 

end 
