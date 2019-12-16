class Airport
  def initialize(capacity)
    @capacity = capacity
    @array = 0 
  end 
  def land(plane)
  raise 'Capacity full cannot land another plane ' if @array >= @capacity 
  @array = @array + 1
  end 

   def take_off(plane)
   end 
end 





