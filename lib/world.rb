class World
  attr_reader :air

  def initialize
    @air = Air.new
  end

  def view
    # TODO: Would be better as a Hash
    [@air]
  end
  
  def add(object)
    return false unless object.is_a?(Airport) || object.is_a?(Plane)
    
    true
  end

  def where_is(object)
    return false unless object.is_a?(Plane)
    
    Airport.new
  end
  
end
