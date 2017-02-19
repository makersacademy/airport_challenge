#require_relative 'plane'

class Airport

  def initialize
    @gateways = []
  end

  def land(plane)
    @plane = plane
    @gateways << @plane
    @gateways[-1]
  end

  def confirm_landing
    "The #{@gateways[-1]} has landed at #{self}."
  end

  def take_off(plane)
    @plane = plane
    @gateways -=[plane]
    @gateways
  end

  def empty_gateway(plane) # Consider using empty_gateway? instead
    message = "The gateway is empty as #{plane} has taken off."
    return message unless @gateways.include?(plane)
  end

end
