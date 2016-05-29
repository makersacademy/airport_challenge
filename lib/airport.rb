require_relative 'plane.rb'


class Airport

  def initialize
    @landed_planes =[]
  end

  def land(plane)
  	fail "This plane has already landed" if plane.landed?
  	plane.land
  	@landed_planes << plane
	"The plane has now landed"
  end

  def take_off(plane)
  	fail "The airport is empty. There are no planes available for take off" if empty?
	@landed_planes.pop
	"The plane has taken off"
  end

  def in_airport?(plane)
	@landed_planes.include? plane
  end

  private 

  def empty?
	true if @landed_planes.empty?
  end
end




