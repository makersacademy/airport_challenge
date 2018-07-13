
class Airport

  attr_accessor :planes
  attr_accessor :weather
  attr_accessor :capacity

  def initialize(capacity = 48) 
    @planes = [] # always starts empty
    @capacity = capacity
  end

end
