
class AirPort

  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :planes

  def initialize(capacity=DEFAULT_CAPACITY)
   @planes = []
   @capacity = capacity

  end

  def land_safely(planes, working=true)
   raise 'airport is full' if full? || stormy?
   @planes << planes
  end

  def full?
   @planes.count >= @capacity
  end

  def take_off_safely(plane)
   raise 'can not take off' if stormy?
   @planes.pop
  end

  def stormy?
   r = Random.new
   r.rand(10...20)
   if r == 12
     true
   else
   false
   end
  end

  def flying?
    true
  end

  def non_flying?
    true
  end

end
