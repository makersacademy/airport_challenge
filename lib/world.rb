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
    return true if object.is_a?(Airport)
    return true if object.is_a?(Plane)
    
    false
  end

  def where_is(object)
    false
  end
  
end
