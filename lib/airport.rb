require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    
    raise "Sorry, airport is full" if airport_full?

    raise "Landing denied, conditions are unsafe" unless safe_conditions?

    @hangar << plane && 'Plane landed safely'
  end

  def takeoff(plane)

    raise 'Unsafe flying conditions, stay grounded' unless safe_conditions?

    @hangar.delete(plane) && 'Plane departed'
  
  end

  private

  def safe_conditions?
    forecast == :sunny
  end
  
  def forecast
    conditions = rand()
    conditions > 0.8 ? :stormy : :sunny
  end

  def airport_full?
    @hangar.length == @capacity
  end
  
end
