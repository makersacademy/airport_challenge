require_relative 'plane.rb'

class Airport

  attr_reader :airborne_planes, :landed_planes, :weather

  def initialize
    @airborne_planes = [Plane.new(1), Plane.new(2)]
    @landed_planes = [Plane.new(1),Plane.new(1)]
    @weather = ['Sunny','Sunny','Sunny','Sunny','Stormy']

  end

  def land_plane
    @landed_planes << @airborne_planes[0]
    @airborne_planes.delete_at(0)
  end

  def takeoff_plane
    take_off = @landed_planes[0]
    @airborne_planes << @landed_planes[0]
    @landed_planes.delete_at(0)
    "#{take_off} has left the airport"
  end

  def weather_generator
    @weather[rand(1..5)]
  end

end

test = Airport.new
puts test.weather_generator
