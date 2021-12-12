class Plane

    attr_reader :status

  def land_plane(plane, airport)
    fail "this plane has landed already!" if @status == "landed"
    fail "PLANE NO" unless airport.hanger_count < airport.capacity
    @weather = plane.check_weather
    fail "Stormy! Plane GO AWAY!" if @weather == "Stormy"
    airport.hanger_in(plane)
    @status = "landed"
  end

  def take_off(plane, airport)
    fail "this plane is flying already!" if @status == "flying"
    @weather = plane.check_weather
    fail "Stormy! Plane STAY!" if @weather == "Stormy"
    airport.hanger_out(plane)
    @status = "flying"
  end

  def check_weather
    "Stormy" if rand(100) > 94
    "Clear"
  end
  
end