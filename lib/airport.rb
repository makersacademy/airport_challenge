class Airport
  attr_reader :hangar
  attr_accessor :weather, :plane, :capacity

  DEFAULT_CAPACITY = 200

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @weather = rand(6) > 4 ? "stormy" : "clear"
    @hangar = []
  end

  def land(plane)  
    hangar << plane
  end
  
  def take_off(plane)   
    raise "#{plane} not in airport" unless hangar.include?(plane)
    hangar.delete(plane)
  end

end
