class Airport

  DEFAULT_CAPACITY=2

  attr_accessor :planes_a
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes_a = []
    @capacity = capacity
  end

  def confirm_take_off(plane)
    planes_a.include?(plane) ? "#{plane} didn't take off" : "#{plane} took off"
  end

  def full?
    planes_a.count >= capacity
  end

end
