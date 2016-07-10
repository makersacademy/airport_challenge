require_relative 'airplane'
require_relative 'weather'

class Airport

  def initialize

  end

  def instruct_to_land(airplane)

  end

  def instruct_to_take_off(airplane)
    airplane.take_off
  end
end
