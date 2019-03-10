class Airport
  attr_reader :capacity
  attr_reader :runway

  def initialize(capacity = 5) 
    @runway = []
    @capacity = capacity
  end 

  

end
