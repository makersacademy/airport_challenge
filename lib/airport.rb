require_relative 'plane'

class Airport
attr_reader :hanger
attr_reader :capacity

  def initialize(capacity = 1)
    @hanger = Array.new
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full cannot land' unless @hanger.length < @capacity
    @hanger.push(plane)
  end

  def take_off(plane)
    @hanger.delete(plane)
    print "#{plane} has left #{self}"
  end

end
