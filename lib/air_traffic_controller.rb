class AirTrafficController

  attr_reader :plane_to_instruct, :weather

  def initialize(plane=nil)
    @plane_to_instruct = plane
  end

  def check_weather
    @weather = Weather.new.current_weather
  end

  def instruct_to_land
    @plane_to_instruct.landing = true unless !@plane_to_instruct
  end

  def instruct_to_take_off
    @plane_to_instruct.taking_off = true unless !@plane_to_instruct
  end

end
