require_relative 'plane'
require_relative 'weather'
class Airport
  DEFAULT_CAPACITY = 40
  attr_reader :airplanes, :capacity, :condition
    
	def initialize(capacity = DEFAULT_CAPACITY, condition = Weather.new)
    @capacity = capacity
    @airplanes = []
    @condition = condition
  end

  def takeoff
    fail "There are no planes!" if @airplanes.empty? 
		
		fail "Crap weather! Don't take off!" if bad_weather
		
		@airplanes.pop
  end

  def land
        
  	fail "You can't land, we're full!" if full?
		
		fail "Crap weather! Don't land!" if bad_weather
		
		land_plane(Planes.new)
  end

private

  def bad_weather
    @condition.crap_weather?
  end

  def land_plane(plane)
    @airplanes << plane
  end

	def full?
  	@airplanes.length >= @capacity
  end
end