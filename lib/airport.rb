
class Airport
  attr_reader :hanger, :weather
  CAPACITY = 2

  def initialize(capacity = CAPACITY)
    @hanger = []
    @capacity =  capacity
    num = rand(3)
    num == 0 ? @weather = "stormy" : @weather = "sunny"
  end

  def plane_lands(plane)
    raise "The hanger is full." unless !full?
    #raise "The weather is too stormy." unless @weather != "stormy"
    @hanger << plane
  end

  def plane_takeoff(plane)
    #raise "The weather is too stormy." unless @weather != "stormy"
    @hanger.delete(plane)
    "Plane took off"
  end

  def full?
    @hanger.length == @capacity
  end  
end
