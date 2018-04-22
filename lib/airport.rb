class Airport
  attr_accessor :planes, :stormy_conditions

  def initialize(capacity = 1, stormy_conditions = false)
    @planes = []
    @stormy_conditions = stormy_conditions
    @capacity = capacity
  end

  def land(plane)
    fail "Weather stormy: unsafe to land." if @stormy_conditions == true
    @planes << plane unless full?
  end

  def take_off
    fail "Weather stormy: can't take off" if @stormy_conditions == true
    fail "No planes avaliable for take off." if @planes.empty?
    @planes.pop
  end

  def full?
    fail "Airport reached capacity." if @planes.size == @capacity
  end

  private

  def capacity
    @capacity
  end

end
