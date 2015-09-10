require_relative "plane"

class Airport
  CAPACITY = 2
  attr_reader :capacity

  def initialize
    @capacity = CAPACITY
    @planes = []
    @instructed_to_take_off = false
    @instructed_to_land = false
  end

  def sky_clear
    if rand(2) == 1; @sky_clear = true else @sky_clear = false end
  end

  def instruct_take_off
    self.sky_clear
    fail "Sky is not clear for take off" if @sky_clear == false
    @instructed_to_take_off = true
  end

  def release_plane plane
    fail "No instruction for take off" if @instructed_to_take_off == false
    @instructed_to_take_off = false
    plane.take_off
    @planes.delete plane
  end

  def instruct_landing
    self.sky_clear
    fail "Sky is not clear for landing" if @sky_clear == false
    fail "Airport is full" if @planes.count >= capacity
    @instructed_to_land = true
  end

  def receive_plane plane
    fail "No instruction for landing" if @instructed_to_land == false
    @instructed_to_land = false
    plane.land
    @planes.push plane
  end
end
