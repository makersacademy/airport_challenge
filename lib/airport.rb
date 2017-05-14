require_relative 'plane'

class Airport
  def plane_landed(plane)
    Plane.new
  end

  def plane_take_off
   fail "No taking off sever weather conditions" if (weather? == true)
   
    Plane.new
  end

  def weather?
    random_weather = rand(5)
    if random_weather == 1
      true
  else
    false
    end
  end

end
