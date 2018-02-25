require_relative 'plane'

class Airport
  def initialize
    @hangar = []
  end

  def take_off
    fail 'No planes available' if @hangar.empty?
    @hangar.pop
  end

  def land(plane)
    fail 'Airport is full' if @hangar.count >= 10
    @hangar << plane
    @hangar[0]
  end

  attr_reader :hangar

end
