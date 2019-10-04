class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :capacity
  attr_accessor :plane_storage
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @plane_storage = []
    @weather = Weather.new
  end

  def take_off
    # weather = false
    # fail 'BAD WEATHER, ALL PLANES GROUNDED' if weather

    plane_storage.pop
  end

  def land(plane_id)
    # weather = true
    # fail 'BAD WEATHER, ALL PLANES GROUNDED' if weather

    fail 'Airport is at max capacity!!!ABORT!' if full?

    plane_storage << plane_id
  end

  def full?
    plane_storage.count >= capacity
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

class Weather
  attr_reader :condition
  @@conditions = [:good, :stormy, :good, :good, :good]
  def initialize
    @condition = @@conditions.sample
  end
end
