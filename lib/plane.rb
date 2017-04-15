require_relative "airport.rb"

class Plane

  def initialize
    @ground_fleet = []
  end

  def land(plane)
    @ground_fleet << plane

  end

  def landed?
    true if @ground_fleet.count > 0
  end

  def take_off
    @ground_fleet.pop
  end

  def departed?
    true if @ground_fleet.count == 0
  end
end
