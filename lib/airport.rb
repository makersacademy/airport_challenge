class Airport
  def initialize(capacity)
    @capacity = capacity
    @array = []
  end 
  def land(plane)
  raise 'Capacity full cannot land another plane ' if full?
  @array << plane
  end 

   def take_off(plane)
   end 
end 


def full?
@array.size >= @capacity

end 

