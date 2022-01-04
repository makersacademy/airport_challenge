require_relative "airplane"

class Airport
  attr_accessor :planes
  def initialize
    @planes = []
    # @capacity
  end

  def land(airplane)
    @planes.push(airplane)
  end

  def take_off(airplane)
  end

  # def full?
  #   true
  # end

  def weather
  end
end
