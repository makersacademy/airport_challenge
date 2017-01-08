class Airport

  attr_reader :airport_name, :full
  alias_method :full?, :full

  DEFAULT_CAPACITY = 3

  def initialize(name)
    @airport_name = name
    @full = false
  end

  def dock(plane)
    
  end

end
