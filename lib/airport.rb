
class Airport
  attr_reader :planes, :capacity
  def initialize(capacity=20)
    @planes = []
    @capacity = capacity
  end

  def full?
     planes.length == capacity ? true : false
  end
end
