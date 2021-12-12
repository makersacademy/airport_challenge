class Plane

    attr_reader :flying
    attr_reader :landed

  def initialize
    @airport = []
    @flying = false
    @landed = false
  end

  def land_plane(plane, airport)
    # fail "this plane has landed already!" unless @landed == false
    fail "PLANE NO" unless @airport.count < airport.capacity
    @weather = plane.check_weather
    fail "Stormy! Plane GO AWAY!" if @weather == "Stormy"
    @airport << plane
    # @flying = false
    # @landed = true
    @airport
  end

  def take_off(plane, airport)
    # fail "this plane is flying already!" unless @flying == false
    @weather = plane.check_weather
    fail "Stormy! Plane STAY!" if @weather == "Stormy"
    @airport.delete(plane)
    # @flying = true
    # @landed = false
    @airport
  end

  def check_weather
    "Stormy" if rand(100) > 94
    "Clear"
  end
  
end
