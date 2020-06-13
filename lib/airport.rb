class Airport
  attr_accessor :hangar
  attr_reader :capacity

  def initialize(capacity = 5)
    @hangar = []
    @capacity = capacity
  end

  def full?
    @hangar.length >= @capacity
  end

end
