load "plane.rb"
load "airport.rb"

class Atc

  def instruct_landing(plane, airport)
    if airport.weather == 'stormy' 
      raise "Cannot land as weather is stormy"
    else plane.location = airport
    end
  end

  def check_location(plane)
    plane.location
  end

  def instruct_takeoff(plane)
    if plane.location.weather == 'stormy'
      raise "Cannot takeoff as weather is stormy"
    else
      plane.location = 'in the sky'
    end
  end
end

# -- DEBUGGING PUTS STATEMENTS -- #

# puts sandy = Atc.new
# puts easyjet = Plane.new
# puts heathrow = Airport.new
# heathrow.weather = 'weather'
# puts heathrow.weather
# puts sandy.instruct_landing(easyjet, heathrow)