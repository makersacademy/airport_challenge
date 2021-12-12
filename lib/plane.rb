class Plane

  # creates the plane status
  attr_reader :status
  attr_reader :location

  def land_plane(plane, airport)
    # checks that the plane has not already landed
    fail "this plane has landed already!" if @status == "landed"
    # checks that the airport hanger isn't full
    fail "PLANE NO" unless airport.hanger_count < airport.capacity
    # checks the weather is safe to land
    fail "Stormy! Plane GO AWAY!" if check_weather == "Stormy"
    # places the plane in the airport hanger
    airport.hanger_in(plane)
    # changes the plane status to landed
    @status = "landed"
    # changes the plane location to be in the airport
    @location = airport
  end

  def take_off(plane, airport)
    # checks the plane is not already flying
    fail "this plane is flying already!" if @status == "flying"
    # checks the weather is safe to fly
    fail "Stormy! Plane STAY!" if check_weather == "Stormy"
    # checks the plane is not at another airport
    fail "you are not at this airport" unless @location == airport || @location == nil
    # takes the plane out of the airport hanger
    airport.hanger_out(plane)
    # changes the plane status to flying
    @status = "flying"
    # changes the plane location to not in the airport
    @location = nil
  end

  def check_weather
    # checks the weather class and returns stormy or clear
    weather = Weather.new
    weather.check
  end
  
end
