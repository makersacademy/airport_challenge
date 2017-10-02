require './lib/airport'

class Plane

  def stormy_weather?
    rand(100)
  end

  def arrive_at_airport
    raise "Too stormy to arrive" if stormy_weather? <= 25
    #Airport.new.permission_to_land if stormy_weather? >= 25
    Airport.new.permission_to_land(self) if stormy_weather? >= 25
  end

  def depart_from_airport
    raise "Too stormy to depart" if stormy_weather? <= 25
    #Airport.new.permission_to_take_off if stormy_weather? >= 25
    Airport.new.permission_to_take_off(self) if stormy_weather? >= 25
  end

end
