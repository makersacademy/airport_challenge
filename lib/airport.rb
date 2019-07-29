require_relative '../lib/plane.rb'

class Airport

  attr_reader :planes
  attr_reader :capacity

  def initialize
    @planes = []
    @capacity = 10
  end

  def update_capacity(new_value)
    @capacity = new_value
  end

end