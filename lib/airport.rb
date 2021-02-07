require_relative 'plane'

class Airport
  attr_reader :hanger

  def initialize(hanger = [])
    @hanger = []
  end

  def land(plane)
    @hanger << plane
  end

  def take_off(plane)
    @hanger.delete(plane)
    @hanger
  end


end
