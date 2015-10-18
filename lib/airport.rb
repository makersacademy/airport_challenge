require_relative 'plane'

class Airport

  attr_accessor :planes

  def initialize
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
    @planes << plane
    @planes.pop
  end

  def full?
    @planes.count >= 50 ? true : false
  end

  def weather
    [:sunny, :stormy, :sunny, :sunny, :sunny, :stormy].shuffle.first
  end

end
