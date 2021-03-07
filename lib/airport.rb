class Airport
  DEFAULT_CAPACITY = 20

  attr_accessor :gates
  attr_reader :capacity, :code

  def initialize(code = self, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @gates = []
    @code = code.to_s
  end

  def safe_to_land?
    !(gates.count == capacity || local_weather == :stormy)
  end

  def safe_to_takeoff?
    (local_weather != :stormy) # nice conditional that replaces if blah true else false
  end

  def local_weather 
    if rand(1..6) == 6
      :stormy
    else
      :clear
    end
  end
end
