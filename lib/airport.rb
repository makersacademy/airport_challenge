class Airport
    DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity 
    @planes = []
  end
def full? 
    raise "plane cannot land at airport because the airport is full" if @planes.length >= @capacity 
end 
def capacity
    default_airport = 30
  if default_airport
    return  @capacity = default_airport
end 
end
end 