class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize
    @hangar = []
  end

  def capacity(value)
    @capacity = value
  end

  def hangar(plane = nil)
    @hangar << plane
  end

  def land
  end

  def take_off
  end
end
