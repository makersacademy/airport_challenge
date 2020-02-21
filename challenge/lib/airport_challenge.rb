require_relative 'plane'
class Airport
  attr_reader :airport
  def initialize(amount_of_planes = 0)
    @airport = []
    @amount_of_planes = amount_of_planes
  end

  def land
  @amount_of_planes += 1
  end

  def take_off
    @amount_of_planes -= 1
  end
end
