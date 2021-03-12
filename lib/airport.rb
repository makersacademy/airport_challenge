require_relative 'plane'

class Airport
attr_reader :hanger

  def initialize
    @hanger = Array.new
  end

  def land(plane)
    @hanger.push(plane)
  end

  def take_off(plane)
    @hanger.delete(plane)
    print "#{plane} has left #{self}"
  end

end
