require_relative('./weather')

class Airport
  attr_reader :capacity, :parked_planes
  include Weather

DEFAULT_CAPACITY = 10


  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @parked_planes = []
  end 

  def is_full?
    true if @parked_planes.count >= DEFAULT_CAPACITY
  end

end