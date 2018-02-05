class Airport

  DEFAULT_CAPACITY=5

  attr_reader :planes_a
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

  def tell_weather
    random() == 1 ? "stormy" : "sunny"
  end

# private # you need to delete tests for random if you want to test with private - private methods break tests

  def random
    1 + rand(6)
  end

end
