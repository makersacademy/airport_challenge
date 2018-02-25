require './lib/plane.rb'
class Airport
  attr_reader :hangar, :plane

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def take_off
    @hangar.pop
    status
  end

  def status
    "#{@hangar.count} planes at the airport"
  end
end
