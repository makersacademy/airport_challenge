# code

require_relative 'plane'

class Control

  attr_reader :capcity

  def initialize
    @capacity = []
  end

  def land(plane)
    @capacity.push(plane)
  end

  def takeoff
  end

end
