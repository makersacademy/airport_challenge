require_relative 'plane'
class Airport
  attr_reader :airport
  def initialize(amount_of_planes = 0)
    @airport
    @plane = amount_of_planes
  end

  def land
    @plane += 1
  end
end
