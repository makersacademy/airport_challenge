class AirTrafficController

  attr_reader :plane_to_instruct, :weather

  def initialize(plane=nil)
    @plane_to_instruct = plane
  end

  def check_weather
    @weather = Weather.new.current_weather
  end

  def instruct_to_land(plane=@plane_to_instruct)
    raise "Landing not permitted in stormy weather" if @weather == "Stormy"
    plane.landing = true unless !plane
  end

  def instruct_to_take_off(plane=@plane_to_instruct)
    raise "Takeoff not permitted in stormy weather" if @weather == "Stormy"
    plane.taking_off = true unless !plane
  end

end
