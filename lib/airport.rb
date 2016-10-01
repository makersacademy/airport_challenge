require_relative 'plane'

class Airport

attr_accessor :planes, :capacity

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end


def empty?
  @planes.empty?
end

def full?
  @planes.count >= @capacity
end

end
