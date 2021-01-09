class Airport
    attr_accessor :capacity
    DEFAULT_CAPACITY = 20
    def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity 
    @planes = []
    
    end
  
  def full?(plane)
   raise "plane cannot land at airport because the airport is full" if @planes.count >= @capacity
  
  
  end

  def receiving_plane 
    raise "Plane cannot land: weather is stormy" if stormy?
   
  end 

  def taking_off
    raise "plane cannot take off: weather is stormy" if stormy? 
  end

  def capacity
    default_airport = 30
  if default_airport
    return  @capacity = default_airport
  end 
  end
 
  def stormy?
   rand(1..6) > 4
  end 
end