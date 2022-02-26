require_relative 'plane'

class Airport
  def initialize
    @airport_deposit = []
  end

  def land(plane)
    return plane
  end

  def take_off(plane)
    return @airport_deposit.delete(plane) if @airport_deposit.include?(plane)
  end

end
