   
class Airport 
  def initialize (capacity)
    @capacity = capacity
    @number = 0 
    @planes = []
  end 

  def land(plane)
    raise "Cannot land: airoport full." if @planes.length >= @capacity
     @planes << plane
  end


  def take_off(plane)
  end
end 