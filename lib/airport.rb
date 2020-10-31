class Airport
  attr_reader :capacity
  
  def initialize(capacity = 50)
    @capacity = capacity
  end
end