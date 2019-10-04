class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :capacity
  attr_accessor :plane_storage

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @plane_storage = []
  end

  def take_off
    plane_storage.pop
  end

  def land(plane_id)
    fail 'Airport is at max capacity!!!ABORT!' if full?

    plane_storage << plane_id
  end

  def full?
    plane_storage.length >= capacity
  end

  def plane_status(plane_id)
    puts "Is plane #{plane_id} still in the airport:"
    print plane_storage.include?(plane_id)
  end
end

class Plane

  attr_accessor :plane

  def initialize
    @plane = rand(1000)
  end
end
