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
    if gates.count == capacity || local_weather == :stormy
      false
      # raise "The conditions do not allow landing at this time"

    else
      true
    end  
  end

  def safe_to_takeoff?
    if local_weather == :stormy
      false
      # raise "The conditions do not allow departure at this time"

    else
      true
    end
  end

  def local_weather 
    if rand(1..6) == 6
      :stormy
    else
      :clear
    end
  end
end
