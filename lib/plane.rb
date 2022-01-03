class Plane

  # creates the plane status
  attr_reader :location

  def land_plane(airport)
    # checks that the plane has not already landed
    fail "this plane has landed already!" unless @location.nil?
    # checks that the airport hanger isn't full
    fail "PLANE NO" unless airport.has_capacity
    # checks the weather is safe to land
    fail "Stormy! Plane GO AWAY!" if check_weather == "Stormy"
    # places the plane in the airport hanger
    airport.hanger_in(self)
    # changes the plane location to be in the airport
    @location = airport
  end

  def take_off(airport)
    # checks the weather is safe to fly
    fail "Stormy! Plane STAY!" if check_weather == "Stormy"
    # checks the plane is not already flying
    fail "this plane is flying already!" if @location.nil?
    # checks the plane is not at another airport
    fail "you are not at this airport" unless @location == airport || @location.nil?
    # takes the plane out of the airport hanger
    airport.hanger_out(self)
    # changes the plane location to not in the airport
    @location = nil
  end

  def check_weather
    # checks the weather class and returns stormy or clear
    weather = Weather.new
    weather.check
  end
  
end
