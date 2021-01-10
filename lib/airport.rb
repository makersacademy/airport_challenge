class Airport
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
  @capacity = capacity 
  end

  def full?
    raise "plane cannot land at airport because the airport is full" 
    if @planes.count >= @capacity
    end
  end 

  def landing 
    raise "Plane cannot land: weather is stormy" if stormy?
  end

  def taking_off
    raise "plane cannot take off: weather is stormy" if stormy? 
  end

  def stormy?
   rand(1..6) > 4
  end 

  def capacity
    default_airport = 30
    if default_airport
    @capacity = default_airport
    end 
  end 
end

