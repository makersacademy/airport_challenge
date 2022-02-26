class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :hangar

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    if full?
      raise "hangar is full"
    else
    @hangar << plane
    end
  end

  def take_off
    @hangar.pop
  end

  private

  def full?
    @hangar.length == @capacity
  end
end
