class Airport

  attr_accessor :planes_in_airport
  attr_accessor :capacity
  attr_accessor :current_weather

  def initialize
    @planes_in_airport = []
    @capacity = 10
    @current_weather = check_weather
  end

  # better to pass argument?
  def land_plane
    check_for_storm
    fail unless @planes_in_airport.length < @capacity
    @planes_in_airport << Plane.new
    @planes_in_airport.last
  end

  # make sure that planes can't take off when planes_at_airport == 0
  def take_off(plane)
    check_for_storm
    @planes_in_airport.delete(plane)
    plane
  end

  def def_capacity(num)
    @capacity = num
  end

  def check_weather
    @current_weather = Weather.new.weather
  end

  def check_for_storm
    fail unless @current_weather != 'stormy'
  end
end 
