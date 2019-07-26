
class Airport

  attr_reader :planes
  attr_reader :capacity

  def initialize
    @planes = []
    @capacity = 10
  end

end