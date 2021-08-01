class Airport
  attr_accessor :landed_planes, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def land(plane)
    landing_requirements_passed?(plane)
    @landed_planes << plane
    plane.landed
    "#{plane} has landed successfully"
  end

  def take_off(plane)
    take_off_requirements_passed?(plane)
    @landed_planes.delete(plane)
    plane.in_flight
    "#{plane} has taken off successfully"
  end

  private

  def landing_requirements_passed?(name)
    raise "No landings allowed while the weather is stormy" if Weather.stormy?
    
    raise "This is not a plane" unless name.instance_of?(Plane)

    raise "This plane has already landed" if @landed_planes.include?(name)
    
    raise "The airport is full" if full?
    
    raise "This plane has landed somewhere else" unless name.flying
 
  end

  def take_off_requirements_passed?(name)
    raise "No take offs allowed while the weather is stormy" if Weather.stormy?
    
    raise "This is not a plane" unless name.instance_of?(Plane)

    raise "This plane is not at the airport" unless @landed_planes.include?(name)
  end

  def full?
    @landed_planes.size == @capacity
  end
end
