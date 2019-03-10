require './lib/air_traffic_controller.rb'

class Plane
  attr_reader :in_flight, :on_tarmac, :please_takeoff, :please_land

  def in_flight
    true
  end

  def on_tarmac
    true
  end
end
