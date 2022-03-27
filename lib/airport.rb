require_relative '../lib/plane.rb'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    fail 'Plane already grounded.' if @hangar.include? plane
    @hangar << plane
  end

  def take_off(plane)
    fail 'No planes in hangar.' if @hangar.count == 0
    fail 'Plane already flying.' if !@hangar.include? plane
    @hangar.pop
  end
end
