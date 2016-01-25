class Airport
  
  attr_reader :name, :planes, :capacity
  attr_accessor :weather
  
  DEFAULT_CAPACITY = 3
  
  def initialize(name, capacity=DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @weather = :sunny
    @planes = []
  end
  
  
  def check_weather
    self.weather = condition
  end
  
  def full?
    @planes.size == airport.capacity
  end

  def clear?
    @weather != :stormy 
  end
  
  private 
  def condition
    condition = [:sunny, :windy, :rainy, :stormy]
    condition[rand(4)]
  end
  

end