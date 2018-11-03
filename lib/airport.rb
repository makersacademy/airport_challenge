require 'plane'

class Airport
  attr_reader :planes
  @@planes = []

  def instruct_plane_land(plane)
    # if bad_weather?
    #   @@planes.delete(plane)
    # else
    #   @@planes << plane
    # end
    @@planes << plane
  end

  def instruct_plane_take_off(plane)
    @@planes.delete(plane)
    return "#{plane} has left airport"
  end

  def bad_weather?
    weather_condition = ['stormy', 'sunny'].sample
    if weather_condition == 'stormy'
      true
    else
      false
    end
  end

end
