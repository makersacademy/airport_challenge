class Airport
    DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity 
    @planes = []
  end
def land(plane)
raise "plane cannot land at airport because the airport is full" if @planes.length >= @capacity 
@planes << plane 
end  
end 
