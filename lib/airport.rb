require_relative 'plane'

class Airport

  attr_accessor :plane, :weather, :capacity

  def initialize(capacity)
    @plane = []
    @weather = "sunny"
    @capacity = 5
  end

  def receive_plane(plane)
    raise("Airport is full, unable to land") if full?
    raise("Bad weather, unable to land") if @weather == "stormy"
      plane.instruct_land
      @plane << plane
  end

  def release_plane(plane)
    raise("Airport is empty, no planes to takeoff") if empty?
    raise("Bad weather, unable to takeoff") if @weather == "stormy"
    plane.instruct_takeoff
    @plane.delete(plane)
  end

  def generate
    if roll == 2
      @weather = "stormy"
    else
      @weather = "sunny"
    end
  end

  private

  def roll
    rand(2) + 1
  end

  def full?
    @plane.count >= 5
  end

  def empty?
    @plane.empty?
  end
end
