require_relative 'plane'

class Airport

  attr_reader :weather, :capacity, :planes
  attr_writer :weather

  def initialize
    random_num = rand(1..100)
    @weather = 'sunny' if random_num <= 90
    @weather = 'stormy' if random_num > 90
    @planes = []
    @capacity = 1
  end

  def full?
    true if @planes.count >= @capacity
  end

end
