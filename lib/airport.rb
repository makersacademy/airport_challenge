require_relative 'plane'

class Airport

  attr_accessor :planes
  attr_accessor :capacity

  def initialize (capacity = 50)
    @capacity = capacity
    @planes = []
  end

  def instruct_to_land(plane)
    fail 'The airport is full.' if full? == true
    fail 'The weather is stormy, landing is not allowed.' if weather == :stormy
    @planes << plane
    @planes.last
  end

  def instruct_to_take_off(plane)
    fail 'The weather is stormy, taking off is not allowed.' if weather == :stormy
    index = @planes.index {|n| n == plane}
    plane_taking_off = @planes.delete_at(index)
  end

  def full?
    @planes.count >= @capacity ? true : false
  end

  def weather
    # [:sunny, :stormy, :sunny, :sunny, :sunny, :stormy].shuffle.first
        [:sunny, :sunny, :sunny, :sunny,].shuffle.first
  end

end
