require_relative 'plane'
class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 50
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "The airport is full" if full?
    fail "It is too stormy to land" if weather == "stormy"

    @plane = plane
    @plane.stops_flying
    @planes << @plane
  end

  def take_off(plane = @plane)
    fail "It is too stormy to take off" if weather == "stormy"
    fail "There are no planes here" if @planes.empty?
    fail "This plane is already flying" if plane.flying?
    @planes.delete(plane)
    plane.starts_flying
  end

  def generate_number
    rand(10)
  end

  def weather
    if self.generate_number <= 1
      "stormy"
    else
      "sunny"
    end
  end

  private
  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

end
