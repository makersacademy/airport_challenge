require_relative 'plane'

class Airport

  attr_accessor :plane


  def instruct_to_take_off(plane)
      fail 'Weather is stormy' if weather_is_stormy?
      @plane
  end

  def instruct_to_land(plane)
    fail 'Weather is stormy' if weather_is_stormy?
    @plane = plane
  end


  def weather_is_stormy?
    return [true, false].sample
  end



end
