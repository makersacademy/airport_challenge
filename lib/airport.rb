require_relative 'plane'

class Airport

  attr_accessor :capacity, :planes, :weather, :stormy, :sunny

  def initialize
    @capacity = 1
    @planes = []
    @weather = self.weather_controller
    @stormy = false
    @sunny = false
  end

  def instruct_landing(landing_plane)
    landing_plane.prepare_to_land if landing_plane.flying == true
  end

  def receive(landing_plane)
    fail "Airport is full" if full
    fail "Too stormy to land" if weather == "stormy"
    landing_plane.land if landing_plane.can_land == true
    planes << landing_plane
  end

  def instruct_take_off(take_off_plane)
    take_off_plane.prepare_to_take_off if take_off_plane.flying == false
  end

  def release(take_off_plane)
    fail "Too stormy to fly" if weather == "stormy"
    take_off_plane.take_off if take_off_plane.can_take_off == true
    planes.delete_if { |a| a == take_off_plane }
  end

  def full
    planes.length >= capacity
  end

  def weather_controller
    if rand(1..10) == 10
      stormy = true
      sunny = false
      "stormy"
    else
      sunny = true
      stormy = false
      "sunny"
    end
  end


end
