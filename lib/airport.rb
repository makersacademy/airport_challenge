class Airport

DEFAULT_CAPACITY=2

  attr_accessor :planes_a
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes_a = []
    @capacity = capacity
  end

  def land(plane)
    fail 'No free spots avaialble' if full?
    if !planes_a.include?(plane) && tell_weather() == "sunny" then
      planes_a << plane
    end
  end

  def take_off(plane)
    tell_weather() == "sunny" && planes_a.include?(plane) ? planes_a.delete(plane) : "the plane cannot take off"
  end

  def confirm_take_off(plane)
    if planes_a.include?(plane) then
      return "#{plane} didn't take off"
    else
      return "#{plane} took off"
    end
  end

  def random
    1 + rand(6)
  end

  def tell_weather
    random() == 1 ? "stormy" : "sunny"
  end

  def full?
    if planes_a.count >= capacity
      true
    end
  end

end
