require_relative 'plane'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def instruct_to_land(plane)
    fail 'The airport is full.' if full? == true
    # fail 'The weather is stormy, cannot land.' if stormy
    @planes << plane
    @planes.last
  end

  def instruct_to_take_off(plane)
    @planes << plane
    @planes.pop
  #   fail 'The weather is stormy, cannot take_off.' if stormy
  end

  def full?
    @planes.count >= 50 ? true : false
  end

  # def stormy
  #
  # end

end
