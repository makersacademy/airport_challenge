require_relative '../lib/plane.rb'

class Airport
  attr_reader :hangar, :capacity

  def initialize
    @hangar = []
    @capacity = 2
  end

  def land(plane)
    fail 'Hangar full.' if @hangar.count >= @capacity
    fail 'Plane already grounded.' if @hangar.include? plane
    @hangar << plane
  end

  def take_off(plane)
    fail 'No planes in hangar.' if @hangar.count == 0
    fail 'Plane already flying.' if !@hangar.include? plane
    @hangar.pop
  end
end
