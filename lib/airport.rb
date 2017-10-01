

class Airport
  attr_accessor   :plane
  attr_accessor :weather



  def land_plane(plane)
    raise 'unable to land due to weather' if @weather == 'stormy'
    @plane = plane
    true
  end

  def takeoff_plane
    raise 'unable to takeoff due to weather' if @weather == 'stormy'
    @plane = nil
    true
  end

  # def initialize(weather)
  #   @weather = weather
  # end

  def weather(weather)
    @weather = weather
  end

end
