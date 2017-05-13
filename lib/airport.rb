require("plane")

class Airport
  attr_reader(:airport_capacity)

  DEFAULT_CAPACITY = 200

  def initialize(airport_capacity = DEFAULT_CAPACITY)
    @airport_capacity = airport_capacity
  end

end