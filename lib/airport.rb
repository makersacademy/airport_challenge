require_relative 'plane'

class Airport
attr_reader :hanger

  def initialize
    @hanger = []
  end

  def land(plane)
    @hanger << plane
  end

  def take_off(plane)
    @hanger.pop
  end

  def plane_at_hanger?
    false if @hanger.empty?
  end
  
end
