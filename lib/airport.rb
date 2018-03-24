class Airport
  attr_reader :max_capacity

  def initialize(max_capacity = 100)
    @max_capacity = max_capacity
  end 
  
  def weather
    %w[stormy rainy sunny calm grey][rand(5)]
  end
end 
