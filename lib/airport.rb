class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :base

  def initialize(capacity = DEFAULT_CAPACITY)
    @base = []
    @capacity = capacity
  end

  def hello(plane)
    if @base.length >= @capacity || !plane.land || @base.include?(plane)
      raise { RuntimeError.new("This plane cannot land") }
    else
      @base.push(plane)
    end
  end

  def byebye(plane)
    i_can_land = plane.take_off && @base.include?(plane) 
    i_can_land ? @base.delete(plane) : raise { RuntimeError.new("NO take off") }
  end
end
