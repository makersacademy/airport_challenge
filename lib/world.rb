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
    
    true
  end

  def where_is(object)
    return false unless object.is_a?(Plane)
    
    Airport.new
  end
  
end
