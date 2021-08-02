class Airport
  attr_reader :hanger, :capacity

  def initialize(capacity = 1)
    @hanger = []
    @capacity = capacity
    @weather = :good_weather
  end

  def land(plane)
    check_weather_report
    raise "Can't land, airport is full." if @hanger.length >= @capacity

    plane.update_location(:air)
    @hanger << plane
  end

  def take_off(plane)
    check_weather_report
    raise "It's too stormy to take off" if @weather == :bad_weather 
    
    plane.update_location(:ground)
    @hanger.delete(plane)
  end

  def check_weather_report
    @weather = Weather.new.weather_report 
  end

end
