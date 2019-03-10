require './lib/plane.rb'

class AirTrafficController
  attr_reader :please_land, :please_takeoff, :on_tarmac, :in_flight

  def landing_instruction
    return "please land"
  end

  def takeoff_instruction
    return "please takeoff"
  end



end
