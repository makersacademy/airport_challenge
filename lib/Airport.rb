class Airport
  attr_reader :capacity
  
  def initialize(capacity = 20)
    @capacity = capacity #capacity refers to the number of planes in the airport
  end
end
