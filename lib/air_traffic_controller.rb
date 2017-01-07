class AirTrafficController

  attr_reader :plane_to_instruct, :weather

  def initialize(plane=nil)
    @plane_to_instruct = plane
  end

  def check_weather
    @weather = Weather.new.current_weather
  end

  def instruct_to_land
    raise "Landing not permitted in stormy weather" if @weather == "Stormy"
    @plane_to_instruct.landing = true unless !@plane_to_instruct
  end

  def instruct_to_take_off
    raise "Takeoff not permitted in stormy weather" if @weather == "Stormy"
    @plane_to_instruct.taking_off = true unless !@plane_to_instruct
  end

end
