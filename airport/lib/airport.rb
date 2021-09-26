#airpotrequire 'plane'

class Airport
  attr_reader :landed_planes
  attr_reader :flying_planes
  DEFAULT_CAPACITY = 20



  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @flying_planes = [] 
    @landed_planes = []
  end

  def capacity
    @capacity
  end

  def landing_flow
    landing_planes = Landing_planes.new(@capacity)
    airport = Airport.new
    if airport.weather == "stormy" ? raise { "Bad Weather. No landing" } : landing_planes.landed_planes(@flying_planes, @landed_planes)
    end
  end


    def take_off_flow
      take_off = Take_off.new
      plane = Plane.new
      take_off(@landed_planes, @flying_planes)
      leaving_planes = @flying_planes.length
      leaving_planes.times { plane.leaving }
    end

  def weather
    current_weather = rand(1..10)
    current_weather <= 3 ? "stormy" : "sunny"
  end
end

