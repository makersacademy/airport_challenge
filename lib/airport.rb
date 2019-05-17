class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :base

  def initialize(capacity = DEFAULT_CAPACITY)
    @base = []
    @capacity = capacity
  end

  def hello(plane)
    if @base.length >= @capacity || !plane.land
      raise { RuntimeError.new("This plane cannot land") }
    else
      @base.push(plane)
    end
  end

  def byebye(plane)
    plane.take_off && @base.include?(plane) ? @base.delete(plane) : raise { RuntimeError.new("This plane cannot take off") }
  end
end
