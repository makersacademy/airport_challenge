require_relative 'plane'

class Airport

  def initialize
    @gateways = []
  end

  def land(plane)
    @gateways << plane
    @gateways.last
  end

  def take_off(plane)
    @gateways -=[plane]
    @gateways
  end

  def empty_gateway(plane) # Consider using empty_gateway? instead
    message = "The gateway is empty as #{plane} has taken off."
    return message unless @gateways.include?(plane)
  end

end
