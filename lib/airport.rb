require_relative '../lib/controller'
DEFAULT_CAPACITY = 20

class Airport
  def initialize(capacity = DEFAULT_CAPACITY)
    @id = 1
    @controller = Controller.new
    @capacity = capacity
    @available_parking = []
  end

  attr_reader :id

  attr_reader :controller

  attr_reader :capacity

  def available_parking
    @available_parking.size
  end
end
