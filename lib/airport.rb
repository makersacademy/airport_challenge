require_relative "plane.rb"

class Airport
    DEFAULT_CAPACITY = 50
    attr_reader :planes, :capacity, :stormy

  def initalize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @stormy = []
  end

  def land(plane)
    raise "There is no room to land!" if full?
    if plane.stormy == true
      @stormy << plane
    else
      @planes << plane
      "Confirm the plane has landed"
    end

  def take_off(plane)
    raise "There aren't any planes here!" if empty?
    if plane.stormy == true
      "No planes are available for take off"
    else
    @planes.pop
    end
  end

  private
  def full?
    @planes.count == @capacity + @stormy.count >= @capacity
  end

  def empty?
    @planes.count + @storm.count == 0
  end
  end
end
