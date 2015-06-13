require_relative 'plane'

class Airport

  attr_accessor :capacity, :planes

  def initialize
    @capacity = 1
    @planes = []
  end

  def instruct_landing(landing_plane)
    landing_plane.prepare_to_land if landing_plane.flying == true
  end

  def receive(landing_plane)
    fail "Airport is full" if full
    landing_plane.land if landing_plane.can_land == true
    planes << landing_plane
  end

  def instruct_take_off(take_off_plane)
    take_off_plane.prepare_to_take_off if take_off_plane.flying == false
  end

  def release(take_off_plane)
    take_off_plane.take_off if take_off_plane.can_take_off == true
    planes.delete_if { |a| a == take_off_plane }
  end

  def full
    planes.length >= capacity
  end

end
