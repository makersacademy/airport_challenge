class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise "Sorry, airport is full" if @hangar.length == @capacity

    @hangar << plane
  end

  def take_off(plane)

    raise 'Unsafe flying conditions, stay grounded' if safe? == false

    @hangar.delete(plane)
  
  end

  private

  def safe?
    forecast == :sunny
  end
  
  def forecast
    conditions = rand()
    conditions > 0.8 ? :stormy : :sunny
  end

end
