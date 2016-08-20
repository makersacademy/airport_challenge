class Airport
  attr_reader :capacity
  CAPACITY = 40

  def initialize(capacity = CAPACITY)
    @capacity = capacity #capacity refers to the number of planes in the airport
  end
end
