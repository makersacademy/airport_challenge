require_relative '../lib/plane'

class Airport

  attr_reader :plane, :plane_count, :capacity

  def initialize(capacity, plane_count)
    @plane = []
    @capacity = capacity
    @plane_count = plane_count
    @plane_count.times { @plane << Plane.new }
  end

  def weather_generator
    rand(10)
  end

  def land_plane(plane)
    @plane_count +=1 
    fail 'Airport capacity is full. No plane could land.' if @plane_count > @capacity
    @plane.push(plane)
  end

  def plane_takeoff
    @weather = weather_generator
    fail 'Weather is stormy. No plane takeoff.' if @weather > 7
    @plane_count -= 1
    @plane_tookoff = @plane.pop
  end

 def confirm_takeoff
    "#{@plane_tookoff.to_s} has now taken off"
 end

end
