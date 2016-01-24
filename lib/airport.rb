class Airport
  
  attr_reader :name, :planes
  attr_accessor :weather
  
  def initialize(name="test")
    @name = name
    @weather = :sunny
    @capacity = 1
    @planes = []
  end
  
  
  def check_weather
    self.weather = condition
  end
  

  def clear?
     @weather != :stormy
  end
  
  private 
  
  def condition
    condition = [:sunny, :windy, :rainy, :stormy]
    condition[(rand(4))]
  end

end