require_relative 'plane.rb'

class Airport

  attr_reader :airborne_planes, :landed_planes, :weather, :capacity

  DEFAULT_CAPACITY = 5

  def initialize(capacity=DEFAULT_CAPACITY)
    @airborne_planes = [Plane.new(1), Plane.new(1)]
    @landed_planes = [Plane.new(1)]
    @weather = ['Sunny','Sunny','Sunny','Sunny','Stormy']
    @capacity = capacity

  end

  def land_plane
    if weather_generator == 'Stormy'
      "No planes can land, due to stormy weather"
    elsif @capacity == @landed_planes.count
       "No planes can land, the airport is at full capacity"
    else
      @landed_planes << @airborne_planes.delete_at(0)
    end
  end

  def takeoff_plane
    if weather_generator == 'Stormy'
      "No planes can take off, due to stormy weather"
    else
      take_off = @landed_planes[0]
      @airborne_planes << @landed_planes.delete_at(0)
      "#{take_off} has left the airport"
    end
  end

  def weather_generator
    @weather[rand(1..5)]
  end

end

# test = Airport.new(2)
# test.land_plane
