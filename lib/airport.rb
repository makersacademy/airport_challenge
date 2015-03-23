require_relative 'plane'

class Airport
  attr_accessor :capacity, :planes, :weather

  def initialize(capacity = 10)
    @capacity = capacity
    @planes = []
    @weather = :good
  end
end
