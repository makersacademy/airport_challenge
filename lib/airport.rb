require 'plane.rb'

class Airport

  def initialize
    @plane = []

  end

  # def capacity
  #   DEFAULT_CAPACITY = 10
  # end

  def land(_plane)
    fail 'Airport full!' if full?
  end

  def take_off(_plane)
    'Plane on route!'
  end

  private

  def full?
    @planes.count >=10
  end

end
