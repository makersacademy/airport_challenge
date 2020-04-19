class World
  attr_reader :air

  def initialize
    @air = Air.new
    @planes = Array.new
    @airports = Array.new
  end

  def view
    # TODO: Would be better as a Hash
    [@air, @airports, @planes]
  end
  
  def add(object)
    return false unless object.is_a?(Airport) || object.is_a?(Plane)

    if object.is_a?(Plane)
      return @air.add(object)
    end

    @airports.push(object)
    return @airports.last == object
  end
  
  def del(object)
    return false unless object.is_a?(Airport) || object.is_a?(Plane)
    
    if object.is_a?(Plane)
      return @air.del(object)
    end
    
    return false unless object.empty?

    @airports.delete(object)
  end

  def where_is(object)
    return false unless object.is_a?(Plane)
    
    if @air.planes.include?(object)
      return @air
    end
    
    false
  end
  
  def land(plane, airport)
    return false unless plane.is_a?(Plane) && airport.is_a?(Airport)
    return false unless where_is(plane) == @air
   
    result = air.del(plane) if airport.add(plane)
    result == plane
  end
  
end
