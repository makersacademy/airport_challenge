class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :base

  def initialize(capacity = DEFAULT_CAPACITY)
    @base = []
    @capacity = capacity
  end

  def add(plane)
    if @base.length >= @capacity || !plane.land
      raise { RuntimeError.new("This plane has not landed") }
    else
      @base.push(plane)
    end
  end

  def remove(plane)
    plane.take_off ? @base.delete(plane) : nil
  end
end
