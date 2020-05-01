
class Airport
    attr_reader :planes, :capacity
    DEFAULT_CAPACITY = 300

def initialize (capacity =DEFAULT)
  @planes = []
  @capacity = capacity
end
end 
